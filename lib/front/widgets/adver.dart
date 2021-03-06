import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//Banner
const admobBannerID = "ca-app-pub-4363316862676869/8538908330";
const admobBannerTestID = "ca-app-pub-3940256099942544/6300978111";
final BannerAd myBanner = BannerAd(
  adUnitId: admobBannerTestID,
  size: AdSize.fullBanner,
  request: const AdRequest(),
  listener: const BannerAdListener(),
);

Widget adContainer(banner, context) {
  return StatefulBuilder(
      builder: (context, setState) => Container(
            alignment: Alignment.center,
            child: AdWidget(ad: banner),
            width: myBanner.size.width.toDouble(),
            height: myBanner.size.height.toDouble(),
          ));
}

//Switch

