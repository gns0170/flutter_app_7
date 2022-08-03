import 'package:flutter/material.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:provider/provider.dart';

class PopUpBackButtonPressed extends StatelessWidget {
  const PopUpBackButtonPressed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainNavigator = context.watch<ProviderNavigation>();
    return AlertDialog(
      title: const Text("메인으로 갑니다?"),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              mainNavigator.changePage(MainPage.home);
            },
            child: const Text("물론")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("잠깐"))
      ],
    );
  }
}
