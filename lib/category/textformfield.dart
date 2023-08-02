// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../helper/constants.dart';

class CustomTextField extends StatefulWidget {
 const CustomTextField(
      {super.key,
      required this.onChange,
      this.obscureText = false,
      required this.hintText});
 final bool obscureText;
 final String hintText;
 final void Function(String) onChange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'FIELD IS EMPTY';
        }
        return null;
      
      },
      onChanged: widget.onChange,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: widget.hintText,
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
