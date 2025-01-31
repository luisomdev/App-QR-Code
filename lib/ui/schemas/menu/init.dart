//Init dart of schema menu
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SchemaMenuInit extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback fnChangeTheme;

  const SchemaMenuInit({super.key, required this.fnChangeTheme});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        title: Row(
          children: AnimateList(effects: [
            FadeEffect(duration: 300.ms)
          ], children: [
            SvgPicture.asset(
              height: 35,
              "assets/icons/openjs.svg",
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            ),
            SizedBox(width: 12),
            Text("SF Qr code"),
          ]),
        ),
        titleSpacing: 25,
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: fnChangeTheme, icon: Icon(Icons.dark_mode)),
                ],
              ))
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Divider(
            height: 1,
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
