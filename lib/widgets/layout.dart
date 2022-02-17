import 'package:flutter/material.dart';
import '../values/colors.dart' as custom_colors;

Widget centerColumn(context) {
  return Container(
    color: custom_colors.primaryColor5,
    child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: context),
    ),
  );
}
