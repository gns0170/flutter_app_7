import 'package:flutter/material.dart';
import 'package:flutter_application_7/front/mainpage/common/texts.dart';

Widget pageNumber(dynamic number) {
  return SizedBox(
    child: Center(
        child: TextQuestion(
      words: number.toString() + '/10',
    )),
  );
}
