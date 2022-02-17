import 'package:flutter/material.dart';
import '../values/colors.dart' as custom_color;

Widget views(inform, context) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    width: MediaQuery.of(context).size.width - 40,
    height: 300,
    color: custom_color.primaryColor1,
    child: inform ?? inform,
  );
}