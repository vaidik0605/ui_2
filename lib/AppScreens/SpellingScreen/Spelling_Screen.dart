import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_2/AppData/AppData.dart';
import 'package:ui_2/AppData/AppWidget.dart';
import 'package:ui_2/AppScreens/HomeScreen/Home_Screen.dart';

import '../../AppData/Appimage.dart';

// ignore: camel_case_types
class Spelling_Screen extends StatefulWidget {
  const Spelling_Screen({Key? key}) : super(key: key);

  @override
  State<Spelling_Screen> createState() => _Spelling_ScreenState();
}

// ignore: camel_case_types
class _Spelling_ScreenState extends State<Spelling_Screen> {
  List<String> spelling = ["E", "E", "H", "A", "T"];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                appbar(
                  title: "1/10",
                  leadingIcon: Images.backIcon,
                  leadingontap: () {
                    Get.back(result: const Home_Screen());
                  },
                  actionIcon: Images.hintIcon,
                  actionontap: () {
                    showDialog(
                      //barrierColor: Colors.red,
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          insetPadding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Container(
                            height: 84,
                            width: 130,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              color: buttoncolor,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              size: 50,
                              color: fontcolor,
                            ),
                          ),
                          alignment: Alignment.center,
                          children: [
                            appText(
                                title: "Do You Want To Watch Video ?",
                                fontSize: 12,
                                color:
                                    (storeData == true) ? fontcolor : textcolor,
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.center),
                            Container(
                              height: Get.height * 0.05,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {},
                                child: appText(
                                    title: "Yes",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: fontcolor),
                              ),
                            ),
                            GestureDetector(
                              child: appText(
                                  title: "Not Now",
                                  fontWeight: FontWeight.w500,
                                  color: (storeData == true)
                                      ? fontcolor
                                      : dialogBoxFontColor,
                                  textAlign: TextAlign.center),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
                Container(
                  height: Get.height * 0.5,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Image.asset(
                    Images.spellingImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SpellingButton(
                      text: "E",
                      height: 70,
                      width: 60,
                      color: buttoncolor,
                    ),
                    SpellingButton(
                      text: "",
                      height: 70,
                      width: 60,
                      color: spellingButtonColor,
                    ),
                    SpellingButton(
                      text: "E",
                      height: 70,
                      width: 60,
                      color: buttoncolor,
                    ),
                    SpellingButton(
                      text: "",
                      height: 70,
                      width: 60,
                      color: spellingButtonColor,
                    ),
                    SpellingButton(
                      text: "H",
                      height: 70,
                      width: 60,
                      color: buttoncolor,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SpellingButton(
                      text: "A",
                      height: 70,
                      width: 60,
                      color: buttoncolor,
                    ),
                    SpellingButton(
                      text: "",
                      height: 70,
                      width: 60,
                      color: spellingButtonColor,
                    ),
                    SpellingButton(
                      text: "T",
                      height: 70,
                      width: 60,
                      color: buttoncolor,
                    ),
                    SpellingButton(
                      text: "",
                      height: 70,
                      width: 60,
                      color: spellingButtonColor,
                    ),
                    SpellingButton(
                      text: "",
                      height: 70,
                      width: 60,
                      color: spellingButtonColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.05,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child:
                        appText(title: "Next", fontSize: 20, color: fontcolor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
