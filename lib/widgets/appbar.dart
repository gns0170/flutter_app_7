import 'package:flutter/material.dart';

dynamic baseAppBar = AppBar(
  actions: [
    IconButton(
      onPressed: () {},
      splashRadius: 30,
      icon: const Icon(Icons.share),
    ),
    const SizedBox(
      width: 2,
    ),
    IconButton(
        onPressed: () {},
        splashRadius: 30,
        icon: const Icon(Icons.format_list_bulleted)),
    const SizedBox(
      width: 17,
    ),
  ],
);
