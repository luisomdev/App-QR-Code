import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

//Directory for create or read database

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;
}

//Create database or open

void createAndOpen(String name) {
  Hive.box(
    name: name,
  );
}
