import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/counter_controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.put(CounterController()); // Support multiple controller

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
              builder: (counterController) => Text(
                "increment  ${counterController.counter}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            // Obx(
            //   () => Text(
            //     '${counterController.counter}',
            //     style: Theme.of(context).textTheme.headlineLarge,
            //   ),
            // ),
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
