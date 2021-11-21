import 'package:flutter/material.dart';
import 'package:health/constant.dart';

class CustomTextFields extends StatelessWidget {
  const CustomTextFields({required this.hintText, required this.textEditingController, required this.textInputType, Key? key}) : super(key: key);

  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: TextField(
        controller: textEditingController,
        keyboardType: textInputType,
        style: const TextStyle(
            fontSize: 14,
            height: 2.5,
            color: Colors.black
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: kColorTextFieldFill,
          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kColorPrimary, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.05),
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
