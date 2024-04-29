//import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:doctor_recommendation/custom_doctor_card2.dart';
import 'package:doctor_recommendation/make_appointment2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:table_calendar/table_calendar.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

//import 'package:mindcare_app/view/make_appointment.dart';
//import 'package:mindcare_app/Langauge/language_controller.dart';
//import 'package:mindcare_app/view/widgets/custom_back_icon.dart';

// ignore: must_be_immutable
class doctorProfile extends StatelessWidget {
  doctorProfile({super.key, this.doctor});
  static String id = "/doctor_profile";

  Map<String, dynamic>? doctor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //LanguageController language = Get.find();
    return Scaffold(
      /* appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
          ),
        ),
        centerTitle: true,
        title: Text(
          doctor!['name'],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ), */
      body: Card(
        elevation: 10,
        color: const Color.fromARGB(255, 247, 245, 245),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.16,
                  ),
                  Text(
                    //doctor!['name'],
                    "Make Appointment".tr,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomDoctorCard(
                doctor: doctor!,
                tap: () {
                  Get.to(MakeAppointment(
                    doctor: doctor!,
                  ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "About Therapist".tr,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                doctor!['Specialization'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 101, 101, 101),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "Location".tr,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                doctor!['Location'].toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 101, 101, 101),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "Price".tr,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                doctor!['Price'].toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 101, 101, 101),
                ),
              ),
            ),
            /* Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  const Text(
                    'Reviews',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {},
                    color: const Color(0xff2296F3),
                    child: const Text(
                      'See Reviews',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ), */
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20, bottom: 20),
              child: EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  print(selectedDate);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
