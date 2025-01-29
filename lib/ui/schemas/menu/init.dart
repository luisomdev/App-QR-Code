//Init dart of schema menu
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/ui/schemas/menu/search.dart';
import 'package:flutter/material.dart';

class SchemaMenuInit extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback fnChangeTheme;

  const SchemaMenuInit({super.key, required this.fnChangeTheme});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 22.0,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('SF Qr code'),
          ],
          isRepeatingAnimation: true,
          totalRepeatCount: 2,
        ),
      ),
      titleSpacing: 20,
      actions: [
        Row(
          children: [
            WindowSearch(),
            SizedBox(width: 5),
            IconButton(onPressed: fnChangeTheme, icon: Icon(Icons.dark_mode)),
            SizedBox(width: 5),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
