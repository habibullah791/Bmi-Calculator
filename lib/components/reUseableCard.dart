import 'package:flutter/material.dart';

class ReUseableCard extends StatelessWidget {

  const ReUseableCard({super.key, required this.cardColor, required this.cardChild});

  final Color cardColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: cardChild,
    );
  }
}

