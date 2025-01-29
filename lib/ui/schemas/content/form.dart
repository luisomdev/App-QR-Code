import 'package:flutter/material.dart';

class _QrCodeTypeStorageData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text("QR Code Type Data"),
    );
  }
}

class _QRCodeForm extends StatelessWidget {
  const _QRCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(child: Text("QR Code Form")),
    );
  }
}
