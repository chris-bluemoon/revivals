import 'package:get/get.dart';
import 'package:unearthed/controllers/item_controller.dart';


class ItemBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ItemController());
  }
}