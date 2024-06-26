import 'package:get/get.dart';

class CounterController extends GetxController {
  // final name = ''.obs;
  // final isLogged = false.obs;
  // final count = 0.obs;
  // final balance = 0.0.obs;
  // final number = 0.obs;
  // final items = <String>[].obs;
  // final myMap = <String, int>{}.obs;
  // final user = User().obs; // Custom classes — it can be any class,

  // var counter = 0.obs;
  int counter = 0;

  // Does not use Streams or ChangeNotifier, uses extremely low resources
  void increment() {
    counter++;
    update(['txtCounter1']);
  }

  // Use Streams or ChangeNotifier, notify widget counter have changed, uses more resources
  void decrement() {
    counter--;
    update(['txtCounter1']);
  }

  void reset() {
    counter = 0;
    update(['txtCounter1']);
    // counter.value = 0;
  }

  // @override
  // void onInit() {
  //   // Get called when controller is created
  //   counter = 0.obs;
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   // Get called after widget is rendered on the screen
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   //Get called when controller is removed from memory
  //   super.onClose();
  // }
}
