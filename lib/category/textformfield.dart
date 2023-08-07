// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../helper/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.onChange,
      this.obscureText = false,
      required this.hintText});
  final bool obscureText;
  final String hintText;
  final void Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'FIELD IS EMPTY';
        }
        return null;
      },
      onChanged: onChange,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kColorLight),
          borderRadius: BorderRadius.circular(30),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
