import 'package:flutter/material.dart';
import 'package:flutter_application_7/front/provider/values/colors.dart'
    as custom_color;

Widget views(inform, context, width) {
  return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width - 40,
      height: width.toDouble() ?? 300,
      color: custom_color.primaryColor1.withOpacity(0.8),
      child: SingleChildScrollView(
        child: Container(
          child: inform ?? inform,
        ),
      ));
}
