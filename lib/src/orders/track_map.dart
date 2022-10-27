import 'dart:typed_data';
import 'dart:math' as math;
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/delivery/delivery.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SimpleMap extends StatefulWidget {
  final double latitude, longitude;
  final String orderId;
  const SimpleMap({Key key, this.latitude, this.longitude, this.orderId})
      : super(key: key);

  @override
  _SimpleMapState createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  // static final LatLng _kMapCenter = LatLng(0.375600, 32.597350);

  // static final CameraPosition _kInitialPosition =
  //     CameraPosition(target: _kMapCenter, zoom: 14.0, tilt: 0, bearing: 0);

  GoogleMapController _controller;
  final Set<Marker> markers = {};
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  final  _orderNumber = TextEditingController();

  LatLng _startLocation = LatLng(0.3641858701721144, 32.605753675139646);
  LatLng endLocation = LatLng(0.33856296332115293, 32.58640158172307);

  @override
  void initState() {
    addMarkers();
    getLocationFromFirebase(widget.orderId);
    getPolyPoints();
    super.initState();
  }

  //query by id order_id from firestore firebase
  getLocationFromFirebase(orderId) async {
    await FirebaseFirestore.instance
        .collection('rider_location')
        .doc(widget.orderId)
        .get()
        .then((value) {
      setState(() {
        _startLocation =
            LatLng(value.data()['latitude'], value.data()['longitude']);
            // addMarkers();
            // onMapCreated(_controller);
        print(_startLocation);
      });
    });
  }

  addMarkers() async {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/marker.png")
        .then(
      (icon) {
        sourceIcon = icon;
      },
    );

    String imgurl = "https://www.fluttercampus.com/img/car.png";
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgurl)).load(imgurl))
        .buffer
        .asUint8List();

    markers.add(Marker(
      markerId: const MarkerId('start'),
      position: _startLocation,
      infoWindow: const InfoWindow(
        title: 'Start',
        snippet: 'Start location',
      ),
      // icon: BitmapDescriptor.fromBytes(bytes),
    ));

    markers.add(Marker(
      markerId: const MarkerId('end'),
      position: endLocation,
      rotation: -45,
      infoWindow: const InfoWindow(
        title: 'End',
        snippet: 'End location',
      ),
      // icon: sourceIcon,
    ));
  }

  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyCiYhjdrRzQKGMOC92Kd2UGqv1-Y-jAzRo', // Your Google Map Key
      PointLatLng(_startLocation.latitude, _startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      setState(() {});
    }
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBar(
        title: "LIVE TRACKING",
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        hoverColor: Colors.cyan,
        elevation: 12,
        heroTag: 'uniqueTag',
        onPressed: () {
          getLocationFromFirebase(widget.orderId);
         
        },
        label: Row(
          children: const [Icon(Icons.add), Text('Track Order')],
        ),
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: polylineCoordinates,
            color: const Color(0xFF7B61FF),
            width: 6,
          ),
        },
        initialCameraPosition: CameraPosition(
            //innital position in map
            target: _startLocation,
            zoom: 14.0 //initial position
            //initial zoom level
            ),
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            _controller = controller;
          });
        },
        markers: markers,
        mapType: MapType.normal,
      ),
      // bottomSheet: BottomSheet(onClosing: onClosing, builder: builder),
    );
  }
}
