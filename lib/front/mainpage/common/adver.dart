import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/data/admob.dart';
import 'package:flutter_application_7/front/mainpage/common/layout.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Widget adContainer(banner, context) {
  return StatefulBuilder(
      builder: (context, setState) => Container(
            alignment: Alignment.center,
            child: AdWidget(ad: banner),
            width: myBanner.size.width.toDouble(),
            height: myBanner.size.height.toDouble(),
          ));
}

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
