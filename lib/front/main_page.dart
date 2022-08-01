import 'package:flutter/material.dart';

import 'package:flutter_application_7/back/functions/iap/logic/dash_purchases.dart';

import 'package:flutter_application_7/front/pages/home.dart';
import 'package:flutter_application_7/front/pages/questions.dart';
import 'package:flutter_application_7/front/pages/result/result.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:flutter_application_7/front/widgets/adver.dart';
import 'package:flutter_application_7/front/widgets/parts/appbar.dart';
import 'package:flutter_application_7/front/widgets/parts/drawer.dart';

import 'package:provider/provider.dart';

//메인 페이지 컨트롤러.
class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  PagesState createState() => PagesState();
}

class PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    var pageProvider = context.watch<ProviderNavigation>();
    var purchase = context.watch<DashPurchases>();
    myBanner.load();

    //페이지 분류
    Widget page = const Home();

    //뒤로가기 설정
    Future<bool> backButtonPressed() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("메인으로 갑니다?"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        setState(() {
                          page = const Home();
                        });
                        Navigator.pop(context);
                      },
                      child: const Text("물론")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("잠깐"))
                ],
              ));
      return Future.value(false);
    }

    Widget pageSecond(pageName) {
      return WillPopScope(
          child: pageName, onWillPop: () => backButtonPressed());
    }

    setState(() {
      switch (pageProvider.pageView) {
        case MainPage.home:
          page = const Home();
          break;
        case MainPage.question:
          page = pageSecond(const Question());

          break;
        case MainPage.result:
          page = pageSecond(const Result());

          break;
      }
    });

    return Scaffold(
        appBar: const BaseAppBar(),
        drawer: const Drawer(child: BaseDrawer()),
        body: page,
        bottomNavigationBar: !purchase.adUpgrade
            ? adContainer(myBanner, context)
            : const SizedBox(
                height: 10,
              ));
  }
}
