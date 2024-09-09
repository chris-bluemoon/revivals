import 'package:get/get.dart';
import 'package:unearthed/services/firestore_storage_service.dart';

class ItemController extends GetxController {
  
  final allItemImages = <String>[].obs;

  @override
  void onReady() {
      getAllItems();
      super.onReady();
  }

  Future<void> getAllItems() async {
    List<String> imgName = ["image1","image2"];

    try {
      for(var img in imgName) {
      final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
      allItemImages.add(imgUrl!);
      }
    } catch(e) {
      print(e);
    }
  }
}