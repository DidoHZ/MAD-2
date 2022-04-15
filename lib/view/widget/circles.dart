import 'package:flutter/material.dart';
import 'package:mad/data/model/circle.dart' as model;

part 'circle.dart';

class Circles extends StatelessWidget {
  final List<model.Circle> childrens;
  final AlignmentDirectional alignmentDirectional;

  const Circles({
    Key? key,
    required this.childrens,
    this.alignmentDirectional = AlignmentDirectional.center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignmentDirectional,
      children: List.generate(
          childrens.length,
          (index) => Circle(
                circle: childrens[index],
              )),
    );
  }
}
