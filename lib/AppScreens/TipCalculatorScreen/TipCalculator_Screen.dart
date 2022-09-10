import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_2/AppData/AppData.dart';
import 'package:ui_2/AppData/AppWidget.dart';
import 'package:ui_2/AppData/Appimage.dart';
import 'package:ui_2/AppScreens/HomeScreen/Home_Screen.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({Key? key}) : super(key: key);

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  TextEditingController amount = TextEditingController();
  TextEditingController tip = TextEditingController();
  TextEditingController tip1 = TextEditingController();
  TextEditingController total = TextEditingController();
  RegExp number = RegExp(r"[0-9]$");
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        //  backgroundColor: bgcolor,
        // extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Column(
          children: [
            otherScreenAppbar(
                image: Images.backIcon,
                ontap: () {
                  Get.back(result: const Home_Screen());
                },
                top: 5,
                left: 80,
                title: "Tip Calculator"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: textfield1Color,
                ),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        if (tip.text.isNotEmpty &&
                            value.isNotEmpty &&
                            number.hasMatch(tip.text) &&
                            number.hasMatch(value)) {
                          String s = tip.text;

                          String s1 = amount.text;
                          int tip2 = int.parse(s);
                          int amt = int.parse(s1);

                          double pr = tip2 * amt / 100;
                          int pr1 = pr.round();
                          int pr2 = pr.round();
                          tip1.text = "$pr1";
                          int total1 = (amt + pr2);

                          total.text = "$total1";
                        } else if (value.isEmpty) {
                          total.text = "";
                        } else {
                          total.text = value;
                        }
                        setState(() {});
                      },
                      textInputAction: TextInputAction.next,
                      controller: amount,
                      cursorColor: textcolor,
                      style: GoogleFonts.montserrat(
                          color: textcolor, fontWeight: FontWeight.w600),
                      keyboardType: TextInputType.phone,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: appText(
                            title: "Bill Amount",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 5),
                          child: appText(
                            title: ".00",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: dividercolor,
                    ),
                    TextField(
                      onChanged: (value) {
                        String s = value;
                        String s1 = amount.text;
                        if (s.isNotEmpty &&
                            s1.isNotEmpty &&
                            number.hasMatch(s) &&
                            number.hasMatch(s1)) {
                          int tip = int.parse(s);
                          int amt = int.parse(s1);

                          double pr = tip * amt / 100;
                          int pr1 = pr.round();
                          int pr2 = pr.round();
                          tip1.text = "$pr1";
                          int total1 = (amt + pr2);

                          total.text = "$total1";
                        } else if (value.isEmpty) {
                          tip1.text = "";
                          total.text = s1;
                        }
                        setState(() {});
                      },
                      controller: tip,
                      style: GoogleFonts.montserrat(
                          color: textcolor, fontWeight: FontWeight.w600),
                      cursorColor: textcolor,
                      keyboardType: TextInputType.phone,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: appText(
                            title: "Tip %",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 5),
                          child: appText(
                            title: "%",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: buttoncolor,
                ),
                child: Column(
                  children: [
                    TextField(
                      showCursor: false,
                      controller: tip1,
                      style: GoogleFonts.montserrat(
                          color: fontcolor, fontWeight: FontWeight.w600),
                      keyboardType: TextInputType.phone,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: appText(
                            title: "Tip",
                            color: fontcolor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 5),
                          child: appText(
                            title: ".00",
                            fontSize: 15,
                            color: fontcolor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: dividercolor,
                    ),
                    TextField(
                      controller: total,
                      enabled: false,
                      style: GoogleFonts.montserrat(
                          color: fontcolor, fontWeight: FontWeight.w600),
                      keyboardType: TextInputType.phone,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: appText(
                            title: "Total",
                            color: fontcolor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 5),
                          child: appText(
                            title: ".00",
                            fontSize: 15,
                            color: fontcolor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
