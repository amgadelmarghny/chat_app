import 'package:flutter/material.dart';
import '../helper/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.onChange,
    this.obscureText = false,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.suffixOnPressed,
  });
  final IconData? suffixIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final String hintText;
  final void Function(String) onChange;
  final Function()? suffixOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
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
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixOnPressed,
                icon: Icon(
                  suffixIcon,
                  color: Colors.white,
                  size: 30,
                ),
              )
            : null,
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
