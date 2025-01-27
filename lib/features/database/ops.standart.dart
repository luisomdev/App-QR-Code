import 'package:hive/hive.dart';

Map<String, String> create(
    String name, String where, Map<String, dynamic> query) {
  final instance = Hive.box(name: name);
  instance.put(where, query);
  return {"Status": "Data send"};
}

Map<String, dynamic> read(String name, String search) {
  final instance = Hive.box(name: name);
  var query = instance.get(search);
  return {"Status": "Good nice", "Data": query};
}

Map<String, dynamic> update(
    String name, String where, Map<String, dynamic> query) {
  final instance = Hive.box(name: name);
  instance.put(where, query);
  return {"Status": "Good nice", "Data": query};
}

Map<String, dynamic> delete(String name, String search) {
  final instance = Hive.box(name: name);
  var query = instance.get(search);
  return {"Status": "Good nice", "Data": query};
}
