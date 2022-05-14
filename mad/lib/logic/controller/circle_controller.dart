import 'package:get/get.dart';
import 'package:mad/constants/enums.dart';
import 'package:mad/data/repository/circle_repository.dart';
import 'package:mad/data/model/circle.dart';

class CircleController extends GetxController {
  final CircleRepository _circleRepository = CircleRepository();
  State _status = State.init;

  List<Circle> circles = [];

  Future<void> getCircles() async {
    _setStatus(State.loading);

    try {
      final res = await _circleRepository.getAll();

      // Sort circles by size (Desc)
      res.sort((a, b) => b.size.compareTo(a.size));

      circles = res;

      _setStatus(State.success);
    } on Exception {
      _setStatus(State.faild);
    }
  }

  void _setStatus(State status) {
    _status = status;
    update();
  }

  get status => _status;
}
