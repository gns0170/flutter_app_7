import 'package:flutter/material.dart';

baseDrawer(BuildContext context) {
  return ListView(
    padding: const EdgeInsets.only(top: 80),
    children: [
      ListTile(
        title: const Text('12'),
        onTap: () {},
      ),
      ListTile(
        title: Text('Statistics'),
        onTap: () {
          Navigator.pushNamed(context, '/question');
        },
      )
    ],
  );
}
