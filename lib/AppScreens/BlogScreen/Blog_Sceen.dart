import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_2/AppData/AppData.dart';
import 'package:ui_2/AppData/AppWidget.dart';
import 'package:ui_2/AppScreens/BlogScreen/detail_BlogScreen.dart';

import '../../AppData/Appimage.dart';
import '../HomeScreen/Home_Screen.dart';

class Blog_Screen extends StatefulWidget {
  const Blog_Screen({Key? key}) : super(key: key);

  @override
  State<Blog_Screen> createState() => _Blog_ScreenState();
}

class _Blog_ScreenState extends State<Blog_Screen> {
  List<Map<String, dynamic>> data = [
    {
      'leading': Images.blogImage1,
      'title': "Education",
      'subtitle': """Registered candidates will be able to download their admit
cards for this entrance exam from the official BHU website 
— bhu.ac.in. Hall tickets for the entrance exam will be
released tomorrow."""
    },
    {
      'leading': Images.blogImage2,
      'title': "Business",
      'subtitle':
          """We should be very worried; there are actually two recessionary
scenarios. In the first quarter of this calendar year, United States'
economy was minus 1.5% GDP.
  """
    },
    {
      'leading': Images.blogImage3,
      'title': "Political",
      'subtitle': """Banerjee on Monday said she doesn’t support corruption and
wouldn’t mind “if life imprisonment is awarded to those who
are guilty"."""
    },
    {
      'leading': Images.blogImage4,
      'title': "Crime",
      'subtitle': """Police arrested Rahul Chauhan, Artish Chauhan,
Tanay Bora,Naimish Rangpara, Bhavesh Chavda and
Ketan Makwana for theiralleged involvement in the crime.
"""
    },
    {
      'leading': Images.blogImage5,
      'title': "Religion",
      'subtitle':
          """A senior officer of the cyber cell said that they had first \
set up a WhatsApp number which they had posted on their
Twitter account after the killing of Dhandhuka's Kishan
Bharwad in January.
"""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //  backgroundColor: bgcolor,
      body: SafeArea(
          child: Column(
        children: [
          otherScreenAppbar(
              image: Images.backIcon,
              ontap: () {
                Get.back(result: const Home_Screen());
              },
              top: 5,
              left: 130,
              title: "Blog"),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider(
                  color: dividercolor,
                );
              },
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Image.asset(
                      data[index]['leading'],
                      fit: BoxFit.fill,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText(
                            title: data[index]['title'],
                            color: (storeData == true) ? fontcolor : textcolor,
                            fontWeight: FontWeight.w700),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => detail_blogScreen(data, index));
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          child: appText(
                              title: "Read Now",
                              fontSize: 10,
                              color: fontcolor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    subtitle: appText(
                      title: data[index]['subtitle'],
                      color: dialogBoxFontColor,
                      fontSize: 10,
                    ),
                  ),
                );
              },
            ),
          ))
        ],
      )),
    );
  }
}
