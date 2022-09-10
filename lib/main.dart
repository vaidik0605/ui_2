import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ui_2/AppData/AppData.dart';
import 'package:ui_2/AppScreens/HomeScreen/Home_Screen.dart';
import 'package:ui_2/Theme/Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await GetStorage.init();
  runApp(const myapp());
}

class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  void initState() {
    super.initState();
    storeData = box.read('theme');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Screen(),
      themeMode: (storeData == true) ? ThemeMode.dark : ThemeMode.light,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
    );
  }
}
