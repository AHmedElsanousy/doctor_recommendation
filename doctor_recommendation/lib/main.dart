import 'package:doctor_recommendation/cities.dart';
import 'package:doctor_recommendation/doctor_location_controller.dart';
import 'package:doctor_recommendation/doctor_profile2.dart';
import 'package:doctor_recommendation/map_view.dart';
import 'package:doctor_recommendation/mapview2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong2/latlong.dart';

void main() {
  runApp(DoctorLocatorApp());
}

class DoctorLocatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Doctor Locator',
      home: MapScreen(
        target: "cairo",
      ),
    );
  }
}

/* class DoctorLocatorScreen extends StatelessWidget {
  final DoctorLocatorController controller = Get.put(DoctorLocatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Locator'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller.cityController,
            decoration: InputDecoration(
              labelText: 'Enter City Name',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  controller.fetchDoctorLocations();

                  Get.to(
                    () => CustomMap(
                      markers: controller.markers,
                      city: controller.cityController.text.toLowerCase(),
                    ),
                  );
                },
              ),
            ),
          ),
          /* Expanded(
            child: Obx(() {
              if (controller.doctorLocations.isEmpty) {
                return Center(child: Text('No doctor locations found'));
              } else {
                return CustomMap(
                  doctorLocations: controller.doctorLocations,
                  markers: controller.markers,
                );
              }
            }),
          ), */
        ],
      ),
    );
  }
}

class CustomMap extends GetView<DoctorLocatorController> {
  final List<Marker> markers;
  final String city;

  const CustomMap({
    required this.markers,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(30.0444, 31.2357), // Initial center of the map
          initialZoom: 10, // Initial zoom level
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            // subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: markers,
          ),
        ],
      ),
    );
  }
}

Marker CustomMarker(Map<String, dynamic> doctor) {
  return Marker(
    rotate: true,
    width: 100.0,
    height: 100.0,
    point: LatLng(doctor['Latitude'], doctor['Longitude']),
    child: IconButton(
      onPressed: () {
        Get.to(doctorProfile(
          doctor: doctor,
        ));
      },
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 224, 39, 26),
          ),
          Text(
            doctor['Doctors_Names'],
            textAlign: TextAlign.center,
            style: const TextStyle(
                inherit: false,
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
} */
