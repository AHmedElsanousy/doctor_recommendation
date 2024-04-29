import 'package:doctor_recommendation/fee_card2.dart';
import 'package:doctor_recommendation/hour_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:mindcare_app/view/widgets/custom_back_icon.dart';

// ignore: must_be_immutable
class MakeAppointment extends StatelessWidget {
  MakeAppointment({
    super.key,
    this.doctor,
  });
  static String id = "/make_appointment";

  Map<String, dynamic>? doctor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Row(
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
                doctor!['name'],
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25.0),
            child: Text(
              'Choose The Hour'.tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HourButton(
                  hour: '8:00 ${"AM".tr}',
                  size: size,
                ),
                HourButton(
                  hour: '10:00 ${"AM".tr}',
                  size: size,
                ),
                HourButton(
                  hour: '1:00 ${"PM".tr}',
                  size: size,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HourButton(
                hour: '3:00 ${"PM".tr}',
                size: size,
              ),
              HourButton(
                hour: '4:00 ${"PM".tr}',
                size: size,
              ),
              HourButton(
                hour: '6:00 ${"PM".tr}',
                size: size,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25.0),
            child: Text(
              "Fee Details".tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          FeeCard(
            size: size,
            title: 'Messeging'.tr,
            subTitle: "Can messege with therapist.".tr,
            icon: Icons.chat_bubble_outline,
            price: 3,
          ),
          FeeCard(
            size: size,
            title: "Voice Call".tr,
            subTitle: "Can make a voice call with therapist.".tr,
            icon: Icons.call_outlined,
            price: 3,
          ),
          FeeCard(
            size: size,
            title: "Video Call".tr,
            subTitle: "Can make a video call with therapist.".tr,
            icon: Icons.video_call_outlined,
            price: 3,
          ),
        ],
      ),
    );
  }
}
