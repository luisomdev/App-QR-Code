import 'package:hive/hive.dart';

Map<String, String> create(String name, String input, String value) {
  final instance = Hive.box(name: name);
  instance.put(input, value);
  return {"Status": "Data send"};
}

String read(String name, String search) {
  final instance = Hive.box(name: name);
  var query = instance.get(search);
  return query ?? "light";
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
