import 'package:app/ui/components/utils/float.button.dart';
import 'package:app/ui/layout/menu.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutMenu(getTitle: "Ratrosky"),
      body: Center(
        child: Text('Hello World!'),
      ),
      floatingActionButton: UtilFloatButton(),
    );
  }
}
