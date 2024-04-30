import 'package:doctor_recommendation/cities.dart';
import 'package:doctor_recommendation/doctor_location_controller.dart';
import 'package:doctor_recommendation/map_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen2 extends StatefulWidget {
  const MapScreen2({super.key});

  @override
  State<MapScreen2> createState() => _MapScreen2State();
}

class _MapScreen2State extends State<MapScreen2> {
  final DoctorLocatorController controller = Get.put(DoctorLocatorController());

  String? pos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            DropdownMenu(
                onSelected: (city) {
                  if (city != null) {
                    controller.fetchDoctorLocations(city);
                    setState(() {});
                    final Set<Marker> mar = controller.markers;
                    /*  print("-----------------------------------------");
                    print("this is marker here");

                    print(mar); */
                    if (mar.isEmpty) {
                      print("-----------------------------------------");
                      print("this is marker here....empty");
                    } else if (mar.isNotEmpty) {
                      print("-----------------------------------------");
                      print(mar);
                    }
                    Get.to(() => CustomMap(
                          city: city.toLowerCase(),
                          markers: controller.markers,
                        ));
                    setState(() {});
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
                  print("-----------------------------------------");
                  print(controller.markers);
                  Get.to(() => CustomMap(
                        city: city.toLowerCase(),
                        markers: controller.markers,
                      ));
                  setState(() {});
                  ;
                }),
          ],
        ),
      ),
    );
  }
}

class CustomMap extends StatefulWidget {
  final Set<Marker> markers;
  final String city;

  const CustomMap({
    super.key,
    required this.markers,
    required this.city,
  });

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: cities[widget.city]!,
            zoom: 11,
          ),
          markers: widget.markers,
        ));
  }
}
