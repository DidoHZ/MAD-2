import 'dart:convert' show json;
import 'dart:math';

import 'package:flutter/widgets.dart';

class Circle {
  final double size;
  Color color;

  Circle({
    required this.size,
    required this.color,
  });

  void setRandomColor() {
    final rand = Random();

    color = Color.fromRGBO(
        rand.nextInt(255), rand.nextInt(255), rand.nextInt(255), rand.nextDouble());
  }

  Map<String, dynamic> toMap() {
    return {
      'size': size,
      'color': color.value,
    };
  }

  factory Circle.fromMap(Map<String, dynamic> map) {
    return Circle(
      size: map['size'],
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Circle.fromJson(String source) => Circle.fromMap(json.decode(source));

  static List<Circle> listFromJson(String source) =>
      List<Circle>.from(json.decode(source).map((x) => Circle.fromMap(x)));

  @override
  String toString() => 'Circle(size: $size, color: $color)';
}
