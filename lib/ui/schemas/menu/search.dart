//Search bar

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

//Data searching.

List<Map> data = [
  {"search": false},
  {"name": "John", "age": 21},
  {"name": "Doe", "age": 22},
  {"name": "Jane", "age": 23},
  {"name": "Doe", "age": 24},
  {"name": "John", "age": 25},
  {"name": "Doe", "age": 26},
  {"name": "Jane", "age": 27},
  {"name": "Doe", "age": 28},
  {"name": "John", "age": 29},
  {"name": "Doe", "age": 30},
  {"name": "Jane", "age": 31},
  {"name": "Doe", "age": 32},
  {"name": "John", "age": 33},
  {"name": "Doe", "age": 34},
  {"name": "Jane", "age": 35},
  {"name": "Doe", "age": 36},
  {"name": "John", "age": 37},
  {"name": "Doe", "age": 38},
  {"name": "Jane", "age": 39},
  {"name": "Doe", "age": 40},
  {"name": "John", "age": 41},
  {"name": "Doe", "age": 42},
  {"name": "Jane", "age": 43},
  {"name": "Doe", "age": 44},
  {"name": "John", "age": 45},
  {"name": "Doe", "age": 46},
  {"name": "Jane", "age": 47},
  {"name": "Doe", "age": 48},
  {"name": "John", "age": 49},
  {"name": "Doe", "age": 50},
  {"name": "Jane", "age": 51},
  {"name": "Doe", "age": 52},
  {"name": "John", "age": 53},
  {"name": "Doe", "age": 54},
  {"name": "Jane", "age": 55},
  {"name": "Doe", "age": 56},
  {"name": "John", "age": 33},
];

class _FiltersPanel extends StatelessWidget {
  final SearchController controller;

  const _FiltersPanel({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FilledButton.tonalIcon(
                onPressed: () {
                  print("Abriendo jeje");
                  controller.text = "Hola";
                  controller.openView();
                },
                label: Text("Filters"),
                icon: Icon(Icons.abc_rounded),
              ),
              FilledButton.tonalIcon(
                onPressed: () {},
                label: Text("Filters"),
                icon: Icon(Icons.abc_rounded),
              ),
              FilledButton.tonalIcon(
                onPressed: () {},
                label: Text("Filters"),
                icon: Icon(Icons.abc_rounded),
              ),
              FilledButton.tonalIcon(
                onPressed: () {},
                label: Text("Filters"),
                icon: Icon(Icons.abc_rounded),
              ),
              FilledButton.tonalIcon(
                onPressed: () {},
                label: Text("Filters"),
                icon: Icon(Icons.abc_rounded),
              ),
            ],
          ),
        ));
  }
}

class _SuggestiveBuilder extends StatelessWidget {
  final SearchController controller;
  final String name;
  final String age;

  const _SuggestiveBuilder(
      {required this.controller, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text("Name is: ${name}, Age is: ${age}"));
  }
}

class _SuggestiveOption extends StatelessWidget {
  final SearchController controller;
  final String name;
  final String age;

  const _SuggestiveOption(
      {required this.controller, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [],
      ),
    );
  }
}

class WindowSearch extends StatelessWidget {
  const WindowSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return ExcludeFocus(
      child: SearchAnchor(
          isFullScreen: true,
          builder: (BuildContext context, SearchController controller) {
            return IconButton(
                onPressed: () {
                  controller.openView();
                },
                icon: Icon(Icons.search));
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            if (controller.value.text.isEmpty) {
              return List.generate(data.length, (index) {
                if (data[index].containsKey("search")) {
                  return _FiltersPanel(controller: controller);
                }
                return _SuggestiveBuilder(
                    controller: controller,
                    name: data[index]["name"],
                    age: data[index]["age"].toString());
              });
            }
            return [
              Animate(
                effects: [FadeEffect(), ScaleEffect()],
                autoPlay: true,
                child: _FiltersPanel(
                  controller: controller,
                ),
              )
            ];
          }),
    );
  }
}
