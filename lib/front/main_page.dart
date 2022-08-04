import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/data/admob.dart';
import 'package:flutter_application_7/back/functions/in_app_purchase/logic/dash_purchases.dart';
import 'package:flutter_application_7/front/common/adver.dart';
import 'package:flutter_application_7/front/common/appbar.dart';
import 'package:flutter_application_7/front/common/drawer.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:flutter_application_7/front/widgets/home.dart';
import 'package:flutter_application_7/front/widgets/questions.dart';
import 'package:flutter_application_7/front/widgets/result/result.dart';

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
