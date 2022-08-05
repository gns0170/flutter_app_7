import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/in_app_purchase/logic/dash_purchases.dart';
import 'package:provider/provider.dart';

class SpacerResult extends StatelessWidget {
  final int number;
  const SpacerResult({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var purchase = context.read<DashPurchases>();
    switch (number) {
      case 0:
        return purchase.adUpgrade == false
            ? const Spacer(flex: 2)
            : const Spacer(flex: 1);
      default:
        return Container();
    }
  }
}
