import 'dart:typed_data';
import 'dart:math' as math;
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMap extends StatefulWidget {
  final double latitude, longitude;
  const SimpleMap({Key key, this.latitude, this.longitude}) : super(key: key);

  @override
  _SimpleMapState createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  // static final LatLng _kMapCenter = LatLng(0.375600, 32.597350);

  // static final CameraPosition _kInitialPosition =
  //     CameraPosition(target: _kMapCenter, zoom: 14.0, tilt: 0, bearing: 0);

  GoogleMapController _controller;
  final Set<Marker> markers = {};

  LatLng startLocation = LatLng(0.375600, 32.597350);
  LatLng endLocation = LatLng(0.335498658, 32.61749753);

  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  addMarkers() async {
    // BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(devicePixelRatio: 2.5),
    //     'assets/images/car.png');

    String imgurl = "https://www.fluttercampus.com/img/car.png";
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgurl)).load(imgurl))
        .buffer
        .asUint8List();

    markers.add(Marker(
      markerId: MarkerId('start'),
      position: startLocation,
      infoWindow: const InfoWindow(
        title: 'Start',
        snippet: 'Start location',
      ),
      icon: BitmapDescriptor.fromBytes(bytes),
    ));

    markers.add(Marker(
      markerId: MarkerId('end'),
      position: endLocation,
      rotation: -45,
      infoWindow: const InfoWindow(
        title: 'End',
        snippet: 'End location',
      ),
      icon: BitmapDescriptor.fromBytes(bytes),
    ));
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
        onPressed: () {},
        label: Row(
          children: const [Icon(Icons.add), Text('Track Order')],
        ),
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
            //innital position in map
            target: startLocation,
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
