import 'dart:math';

import 'package:doctor_recommendation/cities.dart';
import 'package:doctor_recommendation/doctor_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final DoctorLocatorController controller = Get.put(DoctorLocatorController());
  final String target;
  String? pos;

  MapScreen({super.key, required this.target});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Doctor Locator'),
        ),
        body: Center(
          child: Column(
            children: [
              TextFormField(
                //onChanged: (value) => pos = value,
                controller: controller.cityController,
                decoration: InputDecoration(
                  labelText: 'Enter City Name',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      final String city = controller.cityController.text;
                      controller.fetchDoctorLocations(city);
                      Get.to(() => CustomMap(
                            city: controller.cityController.text.toLowerCase(),
                            markers: controller.markers,
                          ));
                    },
                  ),
                ),
              ),
              MaterialButton(
                  child: Text("city"),
                  color: Colors.blue,
                  onPressed: () {
                    final String city = controller.cityController.text;
                    controller.fetchDoctorLocations(city);
                    Get.to(() => CustomMap(
                          city: controller.cityController.text.toLowerCase(),
                          markers: controller.markers,
                        ));
                  }),
            ],
          ),
        )

        /*  CustomMap(
          city: cities[city]!,
          markers: controller.markers,
        ) */

        /* Column(
          children: [
            TextFormField(
              controller: controller.cityController,
              decoration: InputDecoration(
                  labelText: 'Enter City Name',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      city = const LatLng(30.0444, 31.2357);
                      Get.to(() =>
                          CustomMap(city: const LatLng(30.0444, 31.2357)));
                    },
                  )),
            ),
          ],
        ), */
        );
  }
}

class CustomMap extends GetView<DoctorLocatorController> {
  final Set<Marker> markers;
  final String city;

  const CustomMap({
    super.key,
    required this.markers,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: cities[city]!,
            zoom: 12,
          ),
          markers: markers,
        ));
  }
}
