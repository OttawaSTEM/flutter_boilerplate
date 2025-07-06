import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_boilerplate/pages/counter/controller/counter_controller.dart';

class CounterPage extends GetView<CounterController> {
// class CounterPage extends StatelessWidget {              // Support Multiple controller
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller controller = Get.put(controller()); // Support multiple controller
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter GetX Page'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder<CounterController>(
              id: 'txtCounter1',
              builder: (controller) => Text(
                "increment  ${controller.counter}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            GetBuilder<CounterController>(
              builder: (controller) => Text(
                "increment  ${controller.counter}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: controller.decrement,
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: controller.reset,
                  child: const Icon(Icons.refresh),
                ),
                ElevatedButton(
                  onPressed: controller.increment,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
