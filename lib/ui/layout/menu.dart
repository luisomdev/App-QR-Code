import 'package:flutter/material.dart';

class LayoutMenu extends StatelessWidget implements PreferredSizeWidget {
  final String getTitle;

  const LayoutMenu({super.key, required this.getTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 30,
      title: Text(getTitle),
      actions: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  print("Estas oprimiendo el boton de settings");
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://preview.redd.it/x8xu5rjr0gm41.jpg?auto=webp&s=88b0fda1a2927a5981c066a961ed156ce749ac28"),
                ))),
        SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
