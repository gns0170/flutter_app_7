import 'package:flutter/material.dart';
import 'package:flutter_application_7/widgets/texts.dart';
import '../values/colors.dart' as custom_color;

class DataResult {
  final String key;
  final Widget title;
  final Widget explain;
  DataResult(this.key, this.title, this.explain);
}

List<DataResult> r = [
  DataResult(
      'result1',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '탑')
      ]),
      const TextExplain(
        words: '111111',
      )),
  DataResult(
      'result2',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '탑')
      ]),
      const TextExplain(
        words: '22222',
      )),
  DataResult(
      'result3',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '탑')
      ]),
      const TextExplain(
        words: '33333',
      )),
  DataResult(
      'result4',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '탑')
      ]),
      const TextExplain(
        words: '44444',
      )),
  DataResult(
      'result5',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '정글')
      ]),
      const TextExplain(
        words: '111111',
      )),
  DataResult(
      'result6',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '정글')
      ]),
      const TextExplain(
        words: '22222',
      )),
  DataResult(
      'result7',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '정글')
      ]),
      const TextExplain(
        words: '33333',
      )),
  DataResult(
      'result8',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '정글')
      ]),
      const TextExplain(
        words: '44444',
      )),
  DataResult(
      'result9',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '미드')
      ]),
      const TextExplain(
        words: '111111',
      )),
  DataResult(
      'result10',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '미드')
      ]),
      const TextExplain(
        words: '22222',
      )),
  DataResult(
      'result11',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '미드')
      ]),
      const TextExplain(
        words: '33333',
      )),
  DataResult(
      'result12',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '미드')
      ]),
      const TextExplain(
        words: '44444',
      )),
  DataResult(
      'result13',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplain(
        words: '111111',
      )),
  DataResult(
      'result14',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplain(
        words: '22222',
      )),
  DataResult(
      'result15',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplain(
        words: '33333',
      )),
  DataResult(
      'result16',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '원딜')
      ]),
      const TextExplain(
        words: '44444',
      )),
  DataResult(
      'result17',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '화려한', color: custom_color.labelColor1),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplain(
        words: '111111',
      )),
  DataResult(
      'result18',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '정교한', color: custom_color.labelColor2),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplain(
        words: '22222',
      )),
  DataResult(
      'result19',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '협력하는', color: custom_color.labelColor3),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplain(
        words: '33333',
      )),
  DataResult(
      'result20',
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        TextQuestion(words: '숭고한', color: custom_color.labelColor4),
        SizedBox(width: 10),
        TextQuestion(words: '서포터')
      ]),
      const TextExplain(
        words: '44444',
      )),
];
