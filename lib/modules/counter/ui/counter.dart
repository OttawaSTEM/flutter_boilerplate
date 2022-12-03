// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/counter_controller.dart';

class CounterPage extends StatelessWidget {
  final String title;
  const CounterPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final CounterController counterController = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${counterController.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: counterController.decrement,
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: counterController.reset,
                  child: const Icon(Icons.refresh),
                ),
                ElevatedButton(
                  onPressed: counterController.increment,
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

// Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
// body: Center(
//   child: ElevatedButton(
//     child: const Text("Go to Other"),
//     onPressed: () => Get.to(Other()),
//   ),
// ),
// floatingActionButton: FloatingActionButton(
//   onPressed: c.increment,
//   child: const Icon(Icons.add),
// ),

// class Other extends StatelessWidget {
//   // You can ask Get to find a Controller that is being used by another page and redirect you to it.
//   final CounterController c = Get.find();

//   @override
//   Widget build(context) {
//     // Access the updated count variable
//     return Scaffold(body: Center(child: Text("${c.counter}")));
//   }
// }
