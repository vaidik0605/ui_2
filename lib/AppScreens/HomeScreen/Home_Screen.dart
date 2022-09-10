import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ui_2/AppData/AppData.dart';
import 'package:ui_2/AppData/AppWidget.dart';
import 'package:ui_2/AppData/Appimage.dart';
import 'package:ui_2/AppScreens/4optionScreen/4option_Screen.dart';
import 'package:ui_2/AppScreens/BlogScreen/Blog_Sceen.dart';
import 'package:ui_2/AppScreens/SpellingScreen/Spelling_Screen.dart';
import 'package:ui_2/AppScreens/TipCalculatorScreen/TipCalculator_Screen.dart';

// ignore: camel_case_types
class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

// ignore: camel_case_types
class _Home_ScreenState extends State<Home_Screen> {
  RewardedAd? _rewardedAd;
  @override
  void initState() {
    super.initState();
    _createRewardedAd();
  }

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5224354917'
            : 'ca-app-pub-3940256099942544/5224354917',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) => setState(() => _rewardedAd = ad),
          onAdFailedToLoad: (error) => setState(
            () => _rewardedAd = null,
          ),
        ));
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createRewardedAd();
        },
      );
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {},
      );
    } else {
      print("hello");
    }
  }

  int cnt = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Column(
          children: [
            homeScreen_appbar(),
            const SizedBox(
              height: 25,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 30,
                  width: 80,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      color: viewcolor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          storelayout = true;
                          box1.write('mode', storelayout);
                          setState(() {});
                        },
                        child: Image.asset(
                          Images.gridviewIcon,
                          height: 15,
                          width: 15,
                          fit: BoxFit.fill,
                          color:
                              (storelayout == true) ? buttoncolor : textcolor,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: double.infinity,
                        color: dividercolor,
                      ),
                      InkWell(
                        onTap: () {
                          storelayout = false;
                          box1.write('mode', storelayout);
                          setState(() {});
                        },
                        child: Image.asset(
                          Images.listviewIcon,
                          height: 15,
                          width: 15,
                          fit: BoxFit.fill,
                          color:
                              (storelayout == false) ? buttoncolor : textcolor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            (storelayout == true)
                ? Expanded(
                    child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: HomeData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                Get.to(() => const optionScreen());
                              } else if (index == 1) {
                                Get.to(() => const Spelling_Screen());
                              } else if (index == 2) {
                                Get.to(() => const TipCalculator());
                              } else if (index == 3) {
                                Get.to(() => const Blog_Screen());
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(HomeData[index]['bg']),
                                      fit: BoxFit.fill)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      HomeData[index]['icon'],
                                      height: 38,
                                      width: 38,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    appText(
                                      title: HomeData[index]['title'],
                                      color: fontcolor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(height: Get.height * 0.004),
                                    appText(
                                        title: HomeData[index]['subtitle'],
                                        color: fontopacitycolor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10)
                                  ],
                                ),
                              ),
                            ),
                            //  focusColor: Colors.transparent,
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10)),
                  ))
                : Expanded(
                    child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: HomeData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            if (index == 0) {
                              Get.to(() => const optionScreen());
                            } else if (index == 1) {
                              Get.to(() => const Spelling_Screen());
                            } else if (index == 2) {
                              Get.to(() => const TipCalculator());
                            } else if (index == 3) {
                              Get.to(() => const Blog_Screen());
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(HomeData[index]['bg2']),
                                      fit: BoxFit.fill)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Image.asset(
                                      HomeData[index]['icon'],
                                      height: 38,
                                      width: 38,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        appText(
                                          title: HomeData[index]['title'],
                                          color: fontcolor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(height: Get.height * 0.004),
                                        appText(
                                            title: HomeData[index]['subtitle'],
                                            color: fontopacitycolor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )),
          ],
        )),
      ),
      onWillPop: () {
        cnt++;
        print(cnt);
        if (cnt == 1) {
          _showRewardedAd();
        } else {
          SystemNavigator.pop();
        }

        return Future.value();
      },
    );
  }
}
