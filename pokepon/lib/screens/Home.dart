import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokepon/controller/controller.dart';
import 'package:pokepon/controller/languageController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();
    LanguageController languageController = Get.put(LanguageController());
    String url =
        'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg';

    TextEditingController textController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFF0187ba),
      body: ListView(
        children: [
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 100,
                    height: 40,
                    child: TextFormField(
                      controller: textController,
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          )),
                    )),
                TextButton(
                  onPressed: () {
                    setState(() {
                      controller.name = textController.text;
                      controller.onInit();
                    });
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Color(0xFF995c25)),
                  ),
                  child: Obx(
                    () => Text(
                      languageController.language.isNotEmpty
                          ? languageController.language[0].search
                          : 'Ara',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      languageController.selectedLanguage =
                          languageController.selectedLanguage == 'tr'
                              ? 'eng'
                              : 'tr';
                      languageController.onInit();
                    });
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Color(0xFF995c25)),
                  ),
                  child: Obx(
                    () => Text(
                        languageController.language.isNotEmpty
                            ? languageController.language[0].change_language
                            : 'İngilizce',
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Obx(
              () => Column(
                children: [
                  Text(
                      languageController.language.isNotEmpty
                          ? languageController.language[0].normal
                          : 'Normal',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.network(controller.pokemonList.isNotEmpty
                        ? controller.pokemonList[0].back_default
                        : url),
                  ),
                  Text(
                      languageController.language.isNotEmpty
                          ? languageController.language[0].shiny
                          : 'shiny',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.network(controller.pokemonList.isNotEmpty
                        ? controller.pokemonList[0].back_shiny
                        : url),
                  ),
                  Text(
                    '${languageController.language.isNotEmpty ? languageController.language[0].name : 'Adı'}: ${controller.pokemonList.isNotEmpty ? controller.pokemonList[0].name : ''}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
