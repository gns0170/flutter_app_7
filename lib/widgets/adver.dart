import 'package:flutter/material.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_provider/flutter_provider.dart';
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
final BannerAd myBanner2 = BannerAd(
  adUnitId: admobBannerTestID,
  size: AdSize.fullBanner,
  request: const AdRequest(),
  listener: const BannerAdListener(),
);
final BannerAd myBanner3 = BannerAd(
  adUnitId: admobBannerTestID,
  size: AdSize.fullBanner,
  request: const AdRequest(),
  listener: const BannerAdListener(),
);
final BannerAd myBanner4 = BannerAd(
  adUnitId: admobBannerTestID,
  size: AdSize.fullBanner,
  request: const AdRequest(),
  listener: const BannerAdListener(),
);
final BannerAd myBanner5 = BannerAd(
  adUnitId: admobBannerTestID,
  size: AdSize.fullBanner,
  request: const AdRequest(),
  listener: const BannerAdListener(),
);

Widget adContainer(banner, context) {
  Provider.of<AppBarSwitch>(context);
  return appBarSwitch.switchAd == true
      ? StatefulBuilder(
          builder: (context, setState) => Container(
                alignment: Alignment.center,
                child: AdWidget(ad: banner),
                width: myBanner.size.width.toDouble(),
                height: myBanner.size.height.toDouble(),
              ))
      : const SizedBox(
          height: 10,
        );
}

//Switch

