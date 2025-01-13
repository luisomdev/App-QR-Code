import 'package:flutter/material.dart';

class UtilFloatButton extends StatelessWidget {
  const UtilFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        print("Estas oprimiendo el boton flotante");
        showWindow(context);
      },
      child: const Icon(Icons.add),
    );
  }
}

void showWindow(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Add or create'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              print("Estas oprimiendo la opcion 1");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.qr_code),
                SizedBox(width: 7),
                Text("New Qr code")
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              print("Estas oprimiendo la opcion 1");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.workspaces_filled),
                SizedBox(width: 7),
                Text("New workspace")
              ],
            ),
          ),
        ],
      );
    },
  );
}
