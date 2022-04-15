import 'package:http/http.dart' as http;
import 'package:mad/constants/strings.dart';

class CircleAPI {
  final _currenturl = baseurl + "/Circle";

  Future<http.Response> getAll() async {
    return await http.get(Uri.parse(_currenturl));
  }

  Future<http.Response> get(String id) async {
    return await http.get(Uri.parse(_currenturl + "\$id"));
  }

  Future<http.Response> create(String json) async {
    return await http.post(Uri.parse(_currenturl), body: json);
  }

  Future<http.Response> update(String id, String json) async {
    return await http.put(Uri.parse(_currenturl + "\$id"), body: json);
  }

  Future<http.Response> deleteAll() async {
    return await http.delete(Uri.parse(_currenturl));
  }

  Future<http.Response> delete(String id) async {
    return await http.delete(Uri.parse(_currenturl + "\$id"));
  }

}
