import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_2/AppData/AppData.dart';
import 'package:ui_2/AppData/AppWidget.dart';
import 'package:ui_2/AppData/Appimage.dart';
import 'package:ui_2/AppScreens/HomeScreen/Home_Screen.dart';

class Setting_Screen extends StatefulWidget {
  const Setting_Screen({Key? key}) : super(key: key);

  @override
  State<Setting_Screen> createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Column(
        children: [
          otherScreenAppbar(
            title: "Setting",
            left: 120,
            image: Images.backIcon,
            ontap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return Home_Screen();
                },
              ));
            },
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider(
                  color: dividercolor,
                  thickness: 1,
                );
              },
              itemCount: Setting.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    "${Setting[index]['leading']}",
                    fit: BoxFit.fill,
                    color: (storeData == true) ? fontcolor : textcolor,
                    height: 30,
                    width: 30,
                  ),
                  title: appText(
                    title: Setting[index]['title'],
                    color: (storeData == true) ? fontcolor : textcolor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  trailing: (index == 3)
                      ? Switch(
                          value: (storeData is Null) ? false : storeData!,
                          onChanged: (value) {
                            storeData = value;
                            if (storeData == true) {
                              Get.changeThemeMode(ThemeMode.dark);
                              box.write('theme', storeData);
                            } else {
                              Get.changeThemeMode(ThemeMode.light);
                              box.write('theme', storeData);
                            }
                            setState(() {});
                          },
                        )
                      : null,
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
