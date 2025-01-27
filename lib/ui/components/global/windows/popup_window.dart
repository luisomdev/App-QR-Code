//Pops ups of the app

import 'package:flutter/material.dart';

void inCreatePoUpConfirm(context) {}

void inCreatePopupOptions(
    context, List<VoidCallback> fns, List<IconData> icons, List<String> data) {
  showDialog(
      context: context,
      builder: (context) => SimpleDialog(
              children: List.generate(
            fns.length,
            (index) {
              return SimpleDialogOption(
                onPressed: fns[index],
                child: Row(children: [
                  Icon(icons[index]),
                  SizedBox(width: 10),
                  Text(data[index])
                ]),
              );
            },
          )));
}
