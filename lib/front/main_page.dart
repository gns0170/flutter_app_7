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

    Widget page = const Home();

    setState(() {
      switch (pageProvider.pageView) {
        case MainPage.home:
          page = const Home();
          break;
        case MainPage.question:
          page = const Question();
          break;
        case MainPage.result:
          page = const Result();
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
