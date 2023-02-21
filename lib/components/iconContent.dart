import 'package:flutter/material.dart';
import '../constants.dart';



class IconContent extends StatelessWidget {

  const IconContent({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: <Widget> [
          Icon(
            icon,
            size: 80.0,
            color: const Color(0xFF8D8E98),
          ),
          const SizedBox(
            height: 20.0,

          ),
          Text(
            label,
            style: klabelTextStyle,
          )
        ],
      ),
    );
  }
}
