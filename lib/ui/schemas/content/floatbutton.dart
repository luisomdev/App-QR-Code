//Here UI about the floating button
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

ExpandableFab fabExpandable() {
  ExpandableFab fabPanel = ExpandableFab(
    distance: 20,
    openButtonBuilder: DefaultFloatingActionButtonBuilder(
        fabSize: ExpandableFabSize.large, child: Text("data")),
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white12,
        child: Column(
          children: [
            _OptionsFab(
              title: "Option 1",
              icon: Icons.add,
              fn: () {
                print("Option 1");
              },
            ),
            _OptionsFab(
              title: "Option 2",
              icon: Icons.add,
              fn: () {
                print("Option 2");
              },
            ),
            _OptionsFab(
              title: "Option 3",
              icon: Icons.add,
              fn: () {
                print("Option 3");
              },
            ),
          ],
        ),
      )
    ],
  );

  return fabPanel;
}

class _OptionsFab extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback fn;

  const _OptionsFab(
      {super.key, required this.title, required this.icon, required this.fn});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: FloatingActionButton.extended(
        onPressed: fn,
        label: Text(title),
        icon: Icon(icon),
      ),
    );
  }
}
