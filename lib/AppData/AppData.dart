//color
import 'dart:ui';

import 'package:get_storage/get_storage.dart';

import 'Appimage.dart';

dynamic bgcolor = const Color(0xffffffff);
dynamic textcolor = Color(0xff000000);
dynamic buttoncolor = Color(0xff298BFF);
dynamic viewcolor = Color(0xffF5F5F5);
dynamic dividercolor = Color(0xffE0E0E0);
dynamic fontopacitycolor = Color(0xffffffff).withOpacity(0.7);
dynamic fontcolor = Color(0xffffffff);
dynamic wronganscolor = Color(0xffDF1F1F);
dynamic rightanscolor = Color(0xff1EC64D);
dynamic spellingButtonColor = Color(0xffD4E0FF);
dynamic dialogBoxFontColor = Color(0xff707070);
dynamic textfield1Color = Color(0xffFBFBFF);
bool layout = true;
final box = GetStorage();
final box1 = GetStorage();
bool? storeData;
bool? storelayout;

List<Map<String, dynamic>> HomeData = [
  {
    'bg': 'Assets/Group 1.png',
    'bg2': 'Assets/Group 1_2.png',
    'icon': 'Assets/Group 1_1.png',
    'title': '4 option',
    'subtitle': 'Guess The Picture',
  },
  {
    'bg': 'Assets/Group 2.png',
    'bg2': 'Assets/Group 2_2.png',
    'icon': 'Assets/Group 2_1.png',
    'title': 'Spelling',
    'subtitle': 'Guess The Picture',
  },
  {
    'bg': 'Assets/Group 3.png',
    'bg2': 'Assets/Group 3_2.png',
    'icon': 'Assets/Group 3_1.png',
    'title': 'Tip Calculator',
    'subtitle': 'Take The Total Bill',
  },
  {
    'bg': 'Assets/Group 4.png',
    'bg2': 'Assets/Group 4_2.png',
    'icon': 'Assets/Group 4_1.png',
    'title': 'Blog',
    'subtitle': 'Read The Blog',
  },
];

//Setting data
List<Map<String, dynamic>> Setting = [
  {
    'leading': Images.rateIcon,
    'title': "Rate US",
  },
  {
    'leading': Images.shareIcon,
    'title': "Share",
  },
  {
    'leading': Images.privacyIcon,
    'title': "Privacy",
  },
  {
    'leading': Images.colormodeIcon,
    'title': "Color Mode",
  }
];
