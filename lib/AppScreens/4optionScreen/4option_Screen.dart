import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_2/AppData/AppData.dart';
import 'package:ui_2/AppData/AppWidget.dart';
import 'package:ui_2/AppData/Appimage.dart';
import 'package:ui_2/AppScreens/HomeScreen/Home_Screen.dart';

// ignore: camel_case_types
class optionScreen extends StatefulWidget {
  const optionScreen({Key? key}) : super(key: key);

  @override
  State<optionScreen> createState() => _optionScreenState();
}

// ignore: camel_case_types
class _optionScreenState extends State<optionScreen> {
  List<String> option = ["A. Canada", "B. Japan", "C. Switzerland", "D. Dubai"];
  List<bool> colorMode = List.filled(4, false);
  List<Color> color = List.filled(4, buttoncolor);
  bool check = false;
  String rightAns = "D. Dubai";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //  backgroundColor: bgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              appbar(
                leadingIcon: Images.backIcon,
                title: "1/10",
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
                                      borderRadius: BorderRadius.circular(10))),
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
                leadingontap: () {
                  Get.back(result: const Home_Screen());
                },
              ),
              Container(
                height: Get.height * 0.44,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Image.asset(
                  Images.optionImage,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: Get.height * 0.33,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: option.length,
                  itemBuilder: (context, index) {
                    return optionButton(
                      option: option[index],
                      color: color[index],
                      ontap: (check == false)
                          ? () {
                              check = true;
                              if (option[index] == rightAns) {
                                color[index] = rightanscolor;
                              } else {
                                color[index] = wronganscolor;
                                for (int i = 0; i < option.length; i++) {
                                  if (option[i] == rightAns) {
                                    color[i] = rightanscolor;
                                    break;
                                  }
                                }
                              }
                              setState(() {});
                            }
                          : null,
                    );
                  },
                ),
              ),
              Container(
                height: Get.height * 0.05,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: appText(title: "Next", fontSize: 20, color: fontcolor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
