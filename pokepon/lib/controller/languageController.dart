import 'package:get/get.dart';
import 'package:pokepon/model/language.dart';

class LanguageController extends GetxController {
  var language = <Language>[].obs;
  String selectedLanguage = 'tr';

  @override
  void onInit() {
    super.onInit();
    changeLanguage();
  }

  Future<void> changeLanguage() async {
    language.clear();
    if (selectedLanguage == '' || selectedLanguage == 'tr') {
      language.add(Language(
          search: 'Ara',
          name: 'Adı',
          shiny: 'Parlak',
          normal: 'Normal',
          change_language: 'İngilizce'));
    } else {
      language.add(Language(
          search: 'Search',
          name: 'Name',
          shiny: 'Shiny',
          normal: 'Normal',
          change_language: 'Turkish'));
    }
  }
}
