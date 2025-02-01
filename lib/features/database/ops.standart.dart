import 'package:hive/hive.dart';

dynamic create(String name, String input, dynamic value) {
  final instance = Hive.box(name: name);
  instance.put(input, value);
  return instance.get(input);
}

dynamic read(String name, String search) {
  final instance = Hive.box(name: name);
  var query = instance.get(search);
  return query;
}

Map<String, dynamic> update(String name, String input, String value) {
  final instance = Hive.box(name: name);
  instance.put(input, value);
  return {"Status": "Sussceful"};
}

Map<String, dynamic> delete(String name, String search) {
  final instance = Hive.box(name: name);
  var query = instance.get(search);
  return {"Status": "Good nice", "Data": query};
}
