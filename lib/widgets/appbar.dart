import 'package:flutter/material.dart';

baseAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    actions: <Widget>[
      IconButton(
        onPressed: () {},
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
