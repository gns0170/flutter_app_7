import 'package:flutter/material.dart';
import 'package:flutter_application_7/front/widgets/parts/layout.dart';

class AdPurchase extends StatefulWidget {
  const AdPurchase({Key? key}) : super(key: key);

  @override
  _AdPurchaseState createState() => _AdPurchaseState();
}

class _AdPurchaseState extends State<AdPurchase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: centerColumn([
          const Text("1234"),
        ]));
  }
}
