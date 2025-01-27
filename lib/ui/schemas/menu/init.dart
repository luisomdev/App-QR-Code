//Init dart of schema menu
import 'package:animated_text_kit/animated_text_kit.dart';
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
            IconButton(
                onPressed: () {
                  print("Button searching for date? for tags");
                },
                icon: Icon(Icons.search)),
            SizedBox(width: 15),
            IconButton(
                onPressed: () {
                  print("Workspace open modal");
                },
                icon: Icon(Icons.workspaces)),
            SizedBox(width: 15),
            IconButton(onPressed: fnChangeTheme, icon: Icon(Icons.dark_mode)),
            SizedBox(width: 15),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
