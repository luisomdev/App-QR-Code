import 'package:app/features/database/init.dart';
import 'package:app/ui/schemas/content/init.dart';
import 'package:app/ui/schemas/menu/init.dart';
import 'package:app/ui/schemas/menu/search.dart';
import 'package:app/ui/settings/scroll.dart';
import 'package:app/ui/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  await init();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateMainApp();
  }
}

class _StateMainApp extends State<MainApp> {
  bool themeSet = Hive.box(name: 'setting').get('theme', defaultValue: false);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeSet ? ThemeMode.light : ThemeMode.dark,
        home: Scaffold(
          appBar: SchemaMenuInit(
            fnChangeTheme: () {
              setState(() {
                themeSet = !themeSet;
                Hive.box(name: 'setting').put('theme', themeSet);
              });
            },
          ),
          body: SchemaContent(),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: WindowSearch(),
          ),
        ),
      );
    });
  }
}
