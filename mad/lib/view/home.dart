import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad/constants/enums.dart';
import 'package:mad/logic/controller/circle_controller.dart';
import 'package:mad/view/widget/circles.dart';
import 'package:mad/view/widget/dragger.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CircleController circleController = Get.put(CircleController());

  @override
  void initState() {
    circleController.getCircles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CircleController>(
          init: circleController,
          builder: (controller) {
            if (controller.status == Status.loading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            if (controller.status == Status.success) {
              if(controller.circles.isEmpty) return const Center(child: Text("No Data"));
              return Stack(
                fit: StackFit.expand,
                children: [
                  Dragger(
                    child: Circles(childrens: circleController.circles),
                    offset: Offset( Get.size.width / 2 - controller.circles[0].size / 2,
                                    Get.size.height / 2 - controller.circles[0].size / 2 ),
                  )
                ],
              );
            }

            if (controller.status == Status.faild) {
              return const Center(
                child: Icon(Icons.cloud_off_rounded, size: 100),
              );
            }

            throw Exception("Unexpected Status value: " + controller.status);
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: circleController.getCircles,
          child: const Icon(Icons.refresh_rounded)),
    );
  }
}
