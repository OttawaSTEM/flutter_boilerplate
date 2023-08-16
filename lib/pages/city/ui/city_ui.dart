import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/city_controller.dart';
import '../data/city_provider.dart';

class CityPage extends GetView<CityController> {
// class CityPage extends StatelessWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CityController(cityProvider: CityProvider()));

    return Scaffold(
      appBar: AppBar(title: const Text('Cities')),
      body: Container(
        child: controller.obx(
          (state) => ListView.builder(
            itemCount: state?.length,
            itemBuilder: (context, index) {
              return Text(state![index].name);
            },
          ),
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () => controller.insertCity(),
      // ),
    );
  }
}
