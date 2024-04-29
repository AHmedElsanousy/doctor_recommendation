import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:mindcare_app/view/widgets/choose.dart';

class FeeCard extends StatelessWidget {
  const FeeCard({
    super.key,
    required this.size,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.price,
  });

  final Size size;
  final String title;
  final String subTitle;
  final IconData icon;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
      child: InkWell(
        onTap: () {
          /* Get.bottomSheet(
            const ChooseMethodeToPayment(),
            backgroundColor: Colors.white,
          ); */
        },
        child: Card(
            elevation: 2.5,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Container(
                    height: 70,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 217, 231, 238),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.015,
                ),
                SizedBox(
                  width: size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          subTitle,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 99, 94, 94)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$$price",
                    style: const TextStyle(
                        //color: Color.fromARGB(255, 176, 162, 36),
                        color: Color.fromARGB(255, 55, 126, 57),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
