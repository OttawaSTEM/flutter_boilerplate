import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/counter_controller.dart';

class CounterPage extends StatelessWidget {
  // const CounterPage({super.key, required this.title});
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final CounterController c = Get.put(CounterController());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Other"),
          onPressed: () => Get.to(Other()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        child: const Icon(Icons.add),
      ),
    );

//  appBar: AppBar(
//             title: Text(widget.title),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 Text(
//                   '${model.counter}',
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () => model.counter--,
//                       child: const Icon(Icons.remove),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => model.counter = 0,
//                       child: const Icon(Icons.refresh),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => model.increment(),
//                       child: const Icon(Icons.add),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//     ),
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final CounterController c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
