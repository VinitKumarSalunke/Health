import 'package:flutter/material.dart';
import 'package:health/constant.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({required this.text, required this.onPressed, Key? key}) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: double.infinity,
        height: 40,
      ),
      fillColor: kColorPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
