import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class BottomOptionsForm extends StatefulWidget {
  const BottomOptionsForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateBottomOptionsForm();
  }
}

class _StateBottomOptionsForm extends State<BottomOptionsForm> {
  String selectedValue = "Casa"; // Valor inicial

  final List<Map<String, dynamic>> items = [
    {'text': 'Casa', 'icon': Icons.home},
    {'text': 'Trabajo', 'icon': Icons.work},
    {'text': 'Escuela', 'icon': Icons.school},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              child: ExcludeFocus(
                child: DropdownButton<String>(
                  autofocus: false,
                  value: selectedValue,
                  underline: Container(),
                  borderRadius: BorderRadius.circular(10),
                  icon: Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.search)),
                  isExpanded: true,
                  elevation: 0,
                  items: items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item['text'],
                      child: Row(
                        children: [
                          Icon(item['icon'], color: Colors.blue),
                          const SizedBox(width: 10),
                          Text(item['text']),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedValue = value;
                      });
                      // Aquí puedes ejecutar cualquier otra acción
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Seleccionaste: $value")),
                      );
                    }
                  },
                ),
              )),
          FilledButton.tonalIcon(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green)),
              onPressed: () {
                print("Presionado button google");
              },
              label: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text("Guardar")),
              icon: Icon(Icons.save))
        ],
      ),
    );
  }
}
