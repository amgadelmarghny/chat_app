 import 'package:flutter/material.dart';

void snacBar(BuildContext context, String text, ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)) );
  }