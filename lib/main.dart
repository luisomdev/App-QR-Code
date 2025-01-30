import 'package:app/features/database/init.dart';
import 'package:app/ui/schemas/content/init.dart';
import 'package:app/ui/schemas/content/options.dart';
import 'package:app/ui/schemas/menu/init.dart';
import 'package:app/ui/settings/scroll.dart';
import 'package:app/ui/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

void main() {
  init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        home: Scaffold(
          appBar: SchemaMenuInit(
            fnChangeTheme: () {
              print("Change theme");
              verifyTheme(context);
            },
          ),
          body: SchemaContent(),
          floatingActionButtonLocation: ExpandableFab.location,
          bottomNavigationBar: BottomOptionsForm(),
        ),
      );
    });
  }
}
