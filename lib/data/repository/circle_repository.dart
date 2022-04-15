import 'package:mad/data/source/circle_api.dart';
import 'package:mad/data/model/circle.dart';

class CircleRepository {
  final CircleAPI circleAPI = CircleAPI();

  Future<List<Circle>> getAll() async {
    return Circle.listFromJson((await circleAPI.getAll()).body);
  }

  Future<Circle> get(String id) async {
    return Circle.fromJson((await circleAPI.get(id)).body);
  }

  Future<Circle> create(Circle circle) async {
    return Circle.fromJson((await circleAPI.create(circle.toJson())).body);
  }

  Future<Circle> update(String id, Circle model) async {
    return Circle.fromJson((await circleAPI.update(id, model.toJson())).body);
  }

  Future<void> deleteAll() async {
    await circleAPI.deleteAll();
  }

  Future<void> delete(String id) async {
    await circleAPI.delete(id);
  }

}
