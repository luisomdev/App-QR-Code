import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class _ViewerQrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text("QR Code Viewer"),
    );
  }
}

class SchemaContent extends StatelessWidget {
  const SchemaContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: QRCodePage()),
    );
  }
}

class QRCodePage extends StatefulWidget {
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  String qrData = "https://www.ejemplo.com"; // Valor inicial

  // Función para actualizar el contenido del QR
  void updateQRData(String newData) {
    setState(() {
      qrData = newData; // Cambiar el valor de la data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mostrar el código QR con la data dinámica
            QrImageView(
              data: qrData, // Data que se pasa al widget
              size: 200.0,
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            // Campo de texto para cambiar la data del QR
            TextField(
              onChanged: (newText) {
                updateQRData(
                    newText); // Actualiza la data cuando se cambia el texto
              },
              decoration: InputDecoration(
                labelText: "Nuevo dato para el QR",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
