import 'package:eshop/src/constants.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMap extends StatefulWidget {
  const SimpleMap({Key key}) : super(key: key);

  @override
  _SimpleMapState createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {

  static final LatLng _kMapCenter = LatLng(0.375600, 32.597350);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 14.0, tilt: 0, bearing: 0);

   GoogleMapController _controller;

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const GeneralAppBar(
      title: "LIVE TRACKING",
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        hoverColor: Colors.cyan,
        elevation: 12,
        heroTag: 'uniqueTag',
        onPressed: (){},
        label: Row(
          children: const [Icon(Icons.add),
            Text('Track Order')],
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: onMapCreated,
      ),
      bottomSheet: BottomSheet(onClosing: onClosing, builder: builder),
    );
  }
}
