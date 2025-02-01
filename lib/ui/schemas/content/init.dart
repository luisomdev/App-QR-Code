import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SchemaContent extends StatefulWidget {
  const SchemaContent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateContent();
  }
}

class _StateContent extends State<SchemaContent> {
  String qrData = 'wait...data';

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Controladores para cada TextFormField

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo no puede estar vacío';
    }
    final regex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!regex.hasMatch(value)) {
      return 'Solo se permiten letras y números';
    }
    return null;
  }

  void updateQRData(String newData) {
    setState(() => qrData = newData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(10)),
              child: QrImageView(
                version: QrVersions.auto,
                foregroundColor: Theme.of(context).colorScheme.primary,
                data: qrData,
                size: 250.0,
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _controller1,
                      onChanged: null,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: _validateInput,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _controller2,
                      onChanged: (value) => updateQRData(value),
                      decoration: const InputDecoration(
                        labelText: 'Data',
                      ),
                      validator: _validateInput,
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            FilledButton.tonalIcon(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Hive.box(name: 'qrcodes')
                        .put(_controller1.text, _controller2.text);
                    print(
                        Hive.box(name: 'qrcodes').get(_controller1.value.text));
                    print("Form validate");
                  }
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green)),
                icon: Icon(Icons.save),
                label: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: Text("Saved"),
                ))
          ],
        ),
      ),
    );
  }
}
