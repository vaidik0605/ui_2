import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_2/AppData/AppData.dart';

import '../AppScreens/SettingScreen/Setting_Screen.dart';
import 'Appimage.dart';

Widget appText(
    {String? title,
    FontWeight? fontWeight,
    double? fontSize,
    double? letterSpacing,
    Color? color,
    double? height,
    int? maxLines,
    FontStyle? fontStyle,
    TextOverflow? overflow,
    TextAlign? textAlign}) {
  return Text(
    title.toString(),
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    style: GoogleFonts.montserrat(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? textcolor,
        fontStyle: fontStyle),
  );
}

homeScreen_appbar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      PopupMenuButton(
        splashRadius: 10,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onSelected: (item) {},
        itemBuilder: (context) => [
          PopupMenuItem(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    Images.closeIcon,
                    fit: BoxFit.fill,
                    color: (storeData == true) ? fontcolor : textcolor,
                    height: 20,
                    width: 20,
                  )
                ],
              )),
          PopupMenuItem(
              child: Row(
            children: [
              Image.asset(
                Images.rateIcon,
                height: 22,
                width: 22,
                color: (storeData == true) ? fontcolor : textcolor,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: appText(
                  title: "Rate us",
                  fontWeight: FontWeight.w600,
                  color: (storeData == true) ? fontcolor : textcolor,
                  fontSize: 15,
                ),
              ),
            ],
          )),
          PopupMenuItem(
              child: Row(
            children: [
              Image.asset(
                Images.shareIcon,
                height: 22,
                width: 22,
                color: (storeData == true) ? fontcolor : textcolor,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: appText(
                  title: "Share",
                  fontWeight: FontWeight.w600,
                  color: (storeData == true) ? fontcolor : textcolor,
                  fontSize: 15,
                ),
              )
            ],
          )),
          PopupMenuItem(
              child: Row(
            children: [
              Image.asset(
                Images.privacyIcon,
                height: 22,
                color: (storeData == true) ? fontcolor : textcolor,
                width: 22,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: appText(
                  title: "Privacy",
                  fontWeight: FontWeight.w600,
                  color: (storeData == true) ? fontcolor : textcolor,
                  fontSize: 15,
                ),
              )
            ],
          )),
        ],
        icon: Image.asset(
          Images.menuIcon,
          fit: BoxFit.fill,
          height: 22,
          width: 22,
          color: (storeData == true) ? fontcolor : textcolor,
        ),
      ),
      appText(
          title: "Title Name",
          fontSize: 22,
          color: (storeData == true) ? fontcolor : textcolor,
          fontWeight: FontWeight.w600),
      GestureDetector(
        onTap: () {
          Get.to(() => Setting_Screen());
        },
        child: Container(
          margin: EdgeInsets.only(right: 5),
          child: Image.asset(
            Images.settingIcon,
            fit: BoxFit.fill,
            color: (storeData == true) ? fontcolor : textcolor,
            height: 22,
            width: 22,
          ),
        ),
      ),
    ],
  );
}

appbar(
    {String? leadingIcon,
    String? title,
    Color? color,
    String? actionIcon,
    Function()? leadingontap,
    Function()? actionontap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: EdgeInsets.only(left: 5),
        child: GestureDetector(
            onTap: leadingontap,
            child: Image(
              image: AssetImage("$leadingIcon"),
              height: 22,
              width: 22,
              color: (storeData == true) ? fontcolor : textcolor,
              fit: BoxFit.fill,
            )),
      ),
      appText(
        title: title,
        fontSize: 22,
        color: (storeData == true) ? fontcolor : textcolor,
        fontWeight: FontWeight.w600,
      ),
      Container(
        margin: const EdgeInsets.only(right: 5),
        child: InkWell(
            onTap: actionontap,
            child: Image(
              image: AssetImage("$actionIcon"),
              height: 22,
              width: 22,
              color: (storeData == true) ? fontcolor : textcolor,
              fit: BoxFit.fill,
            )),
      )
    ],
  );
}

optionButton({Function()? ontap, String? option, Color? color}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: Get.height * 0.07,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: appText(
        title: option,
        fontWeight: FontWeight.w600,
        color: fontcolor,
        fontSize: 20,
      ),
    ),
  );
}

otherScreenAppbar({
  Function()? ontap,
  String? image,
  String? title,
  double left = 0,
  double top = 0,
}) {
  return Row(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 10, top: 5),
        child: GestureDetector(
          onTap: ontap,
          child: Image.asset(
            "$image",
            height: 22,
            width: 22,
            color: (storeData == true) ? fontcolor : textcolor,
            fit: BoxFit.fill,
          ),
        ),
      ),
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: left, top: top),
        child: appText(
            title: title,
            fontSize: 22,
            color: (storeData == true) ? fontcolor : textcolor,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget SpellingButton(
    {double? height, double? width, Color? color, String? text}) {
  return Container(
    height: height,
    width: width,
    alignment: Alignment.center,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    child: appText(
      title: text,
      fontSize: 30,
      color: fontcolor,
      fontWeight: FontWeight.w600,
    ),
  );
}
