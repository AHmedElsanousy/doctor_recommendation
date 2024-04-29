import 'package:flutter/material.dart';

class HourButton extends StatelessWidget {
  const HourButton({super.key, required this.hour, required this.size});
  final String hour;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      minWidth: size.width * 0.25,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          style: BorderStyle.solid,
          width: 1.7,
          color: Color.fromARGB(255, 104, 174, 232),
        ),
      ),
      child: Text(
        hour,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}