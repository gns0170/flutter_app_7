import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/in_app_purchase/logic/dash_purchases.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/result/data/results.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/result/functions/select_correct_result/check_weight.dart';
import 'package:flutter_application_7/front/mainpage/common/button.dart';
import 'package:flutter_application_7/front/mainpage/common/layout.dart';
import 'package:flutter_application_7/front/mainpage/common/view.dart';
import 'package:flutter_application_7/front/mainpage/widgets/result/common/button.dart';
import 'package:flutter_application_7/front/mainpage/widgets/result/index.dart';
import 'package:provider/provider.dart';

//first Screen
class ResultContext extends StatefulWidget {
  const ResultContext({Key? key}) : super(key: key);

  @override
  _ResultContextState createState() => _ResultContextState();
}

class _ResultContextState extends State<ResultContext> {
  late DashPurchases purchase;
  late CheckWeight checkWeight;
  late DataResult result;

  @override
  Widget build(BuildContext context) {
    checkWeight = context.read<CheckWeight>();
    purchase = context.read<DashPurchases>();

    result = checkWeight.getResult();

    return Scaffold(
        body: centerColumn([
      purchase.adUpgrade == false
          ? const Spacer(flex: 2)
          : const Spacer(flex: 1),
      result.title,
      const SizedBox(height: 6),
      views(result.explain, context, 350),
      const SizedBox(height: 8),
      DarkerButton(
          text: '그래프로 보기',
          onPressed: () {
            globalTabController?.index = 1;
          },
          iconDetail:
              const Icon(Icons.arrow_right_alt, size: 50, color: Colors.white)),
      const Buttons(),
      const Spacer(flex: 1),
      const SizedBox(
        height: 10,
      )
    ]));
  }
}
