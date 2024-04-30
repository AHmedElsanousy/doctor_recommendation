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
              DropdownMenu(
                  onSelected: (city) {
                    if (city != null) {
                      controller.fetchDoctorLocations(city);
                      Get.to(() => CustomMap(
                            city: city.toLowerCase(),
                            markers: controller.markers,
                          ));
                    }
                  },
                  hintText: "Select City",
                  enableFilter: false,
                  width: 300,
                  menuHeight: 300,
                  dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                    DropdownMenuEntry(value: "cairo", label: "Cairo"),
                    DropdownMenuEntry(value: "giza", label: "Giza"),
                    DropdownMenuEntry(value: "alexandria", label: "Alexandria"),
                    DropdownMenuEntry(value: "qalyubia", label: "Qalyubia"),
                    DropdownMenuEntry(value: "gharbia", label: "Gharbia"),
                    DropdownMenuEntry(value: "assiut", label: "Assiut"),
                    DropdownMenuEntry(value: "sohag", label: "Sohag"),
                    DropdownMenuEntry(value: "minya", label: "Minya"),
                    DropdownMenuEntry(value: "qena", label: "Qena"),
                    DropdownMenuEntry(value: "menoufia", label: "Menoufia"),
                    DropdownMenuEntry(value: "dakahlia", label: "Dakahlia"),
                    DropdownMenuEntry(value: "beni suef", label: "Beni suef"),
                    DropdownMenuEntry(value: "sharkia", label: "Sharkia"),
                    DropdownMenuEntry(value: "port said", label: "Port said"),
                  ]),
              /* TextField(
                controller: controller.cityController,
                decoration: InputDecoration(
                  labelText: 'Enter City Name',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      controller
                          .fetchDoctorLocations(controller.cityController.text);
                      Get.to(() => CustomMap(
                            city: controller.cityController.text.toLowerCase(),
                            markers: controller.markers,
                          ));
                    },
                  ),
                ),
              ), */
              Spacer(),
              MaterialButton(
                  child: Text("city"),
                  color: Colors.blue,
                  onPressed: () {
                    final String city = controller.cityController.text;
                    controller.fetchDoctorLocations(city);
                    Get.to(() => CustomMap(
                          city: city.toLowerCase(),
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
            zoom: 11,
          ),
          markers: markers,
        ));
  }
}
