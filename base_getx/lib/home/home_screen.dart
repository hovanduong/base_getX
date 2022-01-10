import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("counter")),
      body: GetBuilder<Controller>(
          init: Controller(),
          builder: (_) => Text(
                'clicks: ${controller.count}',
              )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.increment();
        },
      ),
    );
  }
}

class Controller extends GetxController {
  var count = 0;
  increment() {
    count++;
    update();
  }
}
