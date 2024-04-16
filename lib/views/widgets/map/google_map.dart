import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../../../data/tools/bottom_sheets/order_service_sheets.dart';
import '../../../data/tools/constants/assets/icons.dart';
import '../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../data/tools/constants/style/colors.dart';
import '../../../data/tools/constants/style/fonts.dart';
import '../../../data/tools/extensions/int_extensions.dart';
import '../../pages/base/main/widgets/my_search_field.dart';
import '../../pages/base/profile/security/widgets/security_button.dart';
import '../main_button.dart';

class MyGoogleMap extends StatefulWidget {
  const MyGoogleMap({super.key});

  @override
  State<MyGoogleMap> createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  late final Completer<GoogleMapController> _controller;
  late final TextEditingController positionController;
  Position? _currentPosition;
  final List<Marker> _markers = <Marker>[];

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  void _getCurrentLocation() async {
    _currentPosition = await _determinePosition();
    positionController.text =
        "${_currentPosition?.latitude}, ${_currentPosition?.longitude}";
    _markers.add(Marker(
      markerId: const MarkerId("current"),
      position: LatLng(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      ),
      infoWindow: const InfoWindow(title: 'Current Position'),
    ));
    if (mounted) setState(() {});
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    // OrderServiceSheets.determineLocation(context, size);
  }

  void navigateToCurrentLocation() {
    _determinePosition().then((value) async {
      _markers.add(Marker(
        markerId: const MarkerId("current"),
        position: LatLng(value.latitude, value.longitude),
        infoWindow: const InfoWindow(
          title: 'Current Position',
        ),
      ));

      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 18,
      );

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }

  Future<void> goSomewhere(lat, lng) async {
    final GoogleMapController controller = await _controller.future;
    final double lastZoom = await controller.getZoomLevel();
    positionController.text = "$lat, $lng";
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(lat, lng),
        zoom: lastZoom,
      ),
    ));
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId("current"),
        position: LatLng(lat, lng),
        draggable: true,
      ));
    });
  }

  @override
  void initState() {
    _controller = Completer();
    positionController = TextEditingController();
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: KTColors.white,
      resizeToAvoidBottomInset: false,
      body: _currentPosition != null
          ? Column(
              children: [
                SizedBox(
                  height: 260,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        30.gapY(),
                        TextField(
                          readOnly: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          controller: positionController,
                          style: ktHintStyle,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(16),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15),
                              child: SizedBox.square(
                                dimension: 20,
                                child: SvgPicture.asset(KTIcons.location),
                              ),
                            ),
                            filled: true,
                            fillColor: KTColors.whiteF5,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const MySearchField(
                          hasFilter: false,
                          autofocus: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SecondaryButton(
                                lang.back,
                                size.width / 2 - 24,
                                onPressed: () => Navigator.pop(context),
                              ),
                              MainButton(
                                lang.next,
                                size.width / 2 - 24,
                                hasElevation: true,
                                fontSize: 15,
                                onPressed: () =>
                                    OrderServiceSheets.whenServiceNeed(
                                        context, size),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GoogleMap(
                    onTap: (argument) => goSomewhere(
                      argument.latitude,
                      argument.longitude,
                    ),
                    onCameraMove: (position) async {
                      // final controller = await _controller.future;
                      // controller.moveCamera(CameraUpdate.newCameraPosition(
                      //   CameraPosition(
                      //     target: position.target,
                      //     bearing: position.bearing,
                      //     tilt: position.tilt,
                      //     zoom: position.zoom,
                      //   ),
                      // ));
                      log("--------------------------------------------------");
                      log("bearing - ${position.bearing}");
                      log("target - ${position.target}");
                      log("tilt - ${position.tilt}");
                      log("zoom - ${position.zoom}");
                      log("--------------------------------------------------");
                    },
                    onCameraIdle: () {},
                    trafficEnabled: true,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        _currentPosition!.latitude,
                        _currentPosition!.longitude,
                      ),
                      zoom: 18,
                    ),
                    markers: Set<Marker>.of(_markers),
                    mapType: MapType.normal,
                    padding: const EdgeInsets.only(bottom: 80),
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToCurrentLocation,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: KTColors.white,
        shape: const CircleBorder(),
        splashColor: KTColors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(
            KTIcons.currentLocation,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: KTColors.grey75,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
