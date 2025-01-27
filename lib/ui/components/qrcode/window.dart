import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class _MenuWindow extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
          children: [
            Icon(Icons.qr_code),
            SizedBox(width: 10),
            Text("New qr code")
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("Saved");
              },
              icon: Icon(Icons.check_circle)),
          SizedBox(width: 10)
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

void onBuildFormQrCode(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog.fullscreen(
        child: Scaffold(
          appBar: _MenuWindow(),
          body: _FormQrCode(),
        ),
      );
    },
  );
}

//Section QrCode viewver

class _QrCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hi men google"),
    );
  }
}

//Section form

class _FormQrCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateFormQrCode();
  }
}

class _StateFormQrCode extends State<_FormQrCode> {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: keyForm,
        child: Device.screenType == ScreenType.tablet
            ? Row(
                children: [
                  Flexible(child: _QrCodeView()),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.color_lens),
                        hintText: "Color of workspace",
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.text_fields_outlined),
                        hintText: "Name of workspace",
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Flexible(child: _QrCodeView()),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.color_lens),
                        hintText: "Color of workspace",
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.text_fields_outlined),
                        hintText: "Name of workspace",
                      ),
                    ),
                  ),
                ],
              ));
  }
}
