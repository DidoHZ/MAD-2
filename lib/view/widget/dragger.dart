import 'package:flutter/material.dart';

class Dragger extends StatefulWidget {
  final Widget child;
  final Offset offset;

  const Dragger({Key? key, required this.child, this.offset = Offset.zero})
      : super(key: key);

  @override
  State<Dragger> createState() => DraggerState();
}

class DraggerState extends State<Dragger> {
  late Offset _offset;

  void updateOffset(DragUpdateDetails details) {
    setState(() {
      _offset += Offset(details.delta.dx, details.delta.dy);
    });
  }

  @override
  void initState() {
    _offset = widget.offset;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: GestureDetector(onPanUpdate: updateOffset, child: widget.child),
    );
  }
}
