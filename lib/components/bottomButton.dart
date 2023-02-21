import 'package:flutter/material.dart';
import '../constants.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  const BottomButton({super.key, required this.title, required this.onPress});

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return           GestureDetector(
      onTap: onPress,
      child: Container(
        color: kbottomCardColor,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 10.0),
        height: bottomContainerHeight,
        width: double.infinity,
        child: Center(
            child: Text(
              title.toString(),
              style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            )
        ),
      ),
    );
  }
}
