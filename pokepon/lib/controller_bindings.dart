import 'package:get/get.dart';
import 'package:pokepon/controller/controller.dart';
import 'package:pokepon/controller/languageController.dart';

class ControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
    Get.put<LanguageController>(LanguageController());
  }
}
