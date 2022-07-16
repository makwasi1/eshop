import 'dart:async';
import 'dart:math';

import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapTracker extends StatefulWidget {
  final double latitude, longitude;
  final String from;

  const MapTracker({Key key, this.latitude, this.longitude, this.from})
      : super(key: key);

  @override
  _MapTrackerState createState() => _MapTrackerState();
}

class _MapTrackerState extends State<MapTracker> {
  LatLng latlong;
  CameraPosition _cameraPosition;
  GoogleMapController _controller;
  TextEditingController locationController = TextEditingController();
  final Set<Marker> _markers = Set();

  Future getCurrentLocation() async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(widget.latitude, widget.longitude);

    if (mounted) {
      setState(() {
        latlong = LatLng(widget.latitude, widget.longitude);

        _cameraPosition =
            CameraPosition(target: latlong, zoom: 15.0, bearing: 0);
        if (_controller != null) {
          _controller
              .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
        }

        var address;

        address = placemark[0].name;
        address = address + "," + placemark[0].subLocality;
        address = address + "," + placemark[0].locality;
        address = address + "," + placemark[0].administrativeArea;
        address = address + "," + placemark[0].country;
        address = address + "," + placemark[0].postalCode;

        locationController.text = address;
        _markers.add(Marker(
          markerId: const MarkerId("Marker"),
          position: LatLng(widget.latitude, widget.longitude),
        ));
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _cameraPosition = const CameraPosition(target: LatLng(0, 0), zoom: 10.0);
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GeneralAppBar(
        title: "Map",
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(children: [
                (latlong != null)
                    ? GoogleMap(
                        initialCameraPosition: _cameraPosition,
                        onMapCreated: (GoogleMapController controller) {
                          _controller = (controller);
                          _controller.animateCamera(
                              CameraUpdate.newCameraPosition(_cameraPosition));
                        },
                        markers: myMarker(),
                        onTap: (latLng) {
                          if (mounted) {
                            setState(() {
                              latlong = latLng;
                            });
                          }
                        })
                    : Container(),
              ]),
            ),
            TextField(
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
              cursorColor: Theme.of(context).colorScheme.onSurface,
              controller: locationController,
              readOnly: true,
              decoration: InputDecoration(
                icon: Container(
                  margin: const EdgeInsetsDirectional.only(start: 20, top: 0),
                  width: 10,
                  height: 10,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.green,
                  ),
                ),
                hintText: "Enter your location",
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsetsDirectional.only(start: 15.0, top: 12.0),
              ),
            ),
            ElevatedButton(
              child: Text(
                 "UPDATE_LOCATION",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              onPressed: () {
                if (widget.from == 'ADDADDRESS') {
                  var latitude = latlong.latitude.toString();
                  var longitude = latlong.longitude.toString();
                }


                Navigator.pop(context);
              },
            ),
          ],
        )));
  }

  Set<Marker> myMarker() {
    if (_markers != null) {
      _markers.clear();
    }

    _markers.add(Marker(
      markerId: MarkerId(Random().nextInt(10000).toString()),
      position: LatLng(latlong.latitude, latlong.longitude),
    ));

    getLocation();

    return _markers;
  }

  Future<void> getLocation() async {

    List<Placemark> placemark =
        await placemarkFromCoordinates(latlong.latitude, latlong.longitude);

    var address;

    address = placemark[0].name;

    address = address + "," + placemark[0].subLocality;
    address = address + "," + placemark[0].locality;
    address = address + "," + placemark[0].administrativeArea;
    address = address + "," + placemark[0].country;
    address = address + "," + placemark[0].postalCode;
    locationController.text = address;
    if (mounted) setState(() {});
  }
}
