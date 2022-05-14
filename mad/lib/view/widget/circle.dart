part of 'circles.dart';

class Circle extends StatefulWidget {
  final model.Circle circle;

  const Circle({
    required this.circle,
    Key? key,
  }) : super(key: key);

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() { widget.circle.setRandomColor(); }),
      child: Container(
        width: widget.circle.size.toDouble(),
        height: widget.circle.size.toDouble(),
        decoration:
            BoxDecoration(color: widget.circle.color, shape: BoxShape.circle),
      ),
    );
  }
}
