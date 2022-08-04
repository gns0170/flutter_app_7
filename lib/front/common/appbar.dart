import 'package:flutter/material.dart';
import 'package:flutter_application_7/front/provider/popup.dart';

import 'package:provider/provider.dart';

class BaseAppBar extends StatefulWidget with PreferredSizeWidget {
  const BaseAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  _BaseAppBarState createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  //inapp purchase

  @override
  Widget build(BuildContext context) {
    var providerPopUp = context.watch<ProviderPopup>();

    return AppBar(
      automaticallyImplyLeading: false,
      actions: <Widget>[
        //const InitBackend(),
        IconButton(
          onPressed: () {
            providerPopUp.adPurchaseOnOff();
          },
          splashRadius: 30,
          icon: const Icon(Icons.share),
        ),
        const SizedBox(
          width: 2,
        ),
        Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                splashRadius: 30,
                icon: const Icon(Icons.format_list_bulleted));
          },
        ),
        const SizedBox(
          width: 17,
        ),
      ],
    );
  }
}
