import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui_2/AppData/AppData.dart';
import 'package:ui_2/AppData/AppWidget.dart';
import 'package:ui_2/AppScreens/BlogScreen/Blog_Sceen.dart';

import '../../AppData/Appimage.dart';

class detail_blogScreen extends StatefulWidget {
  List data = [];
  int index;
  detail_blogScreen(this.data, this.index);

  @override
  State<detail_blogScreen> createState() => _detail_blogScreenState();
}

class _detail_blogScreenState extends State<detail_blogScreen> {
  List<Map<String, dynamic>> full_Details = [
    {
      'image': Images.educationImage,
      'details':
          """After Delhi University officials informing that the admissions process will be delayed, the Jawaharlal Nehru University Teachers Association (JNUTA) today expressed concerns over the delay in admissions and demanded that the institution restore its time-tested admission procedure instead of relying on the National Testing Agency.

This comes amid the rescheduling of the Common University Entrance Test (CUET)-UG, conducted by the NTA. The CUET-UG, which was scheduled to end on August 20, will now conclude on August 28.

The JNU teachers’ organisation passed a resolution on Monday during its general body Meeting, urging the university to withdraw from the agreement with the NTA.""",
    },
    {
      'image': Images.businessImage,
      'details':
          """With the easing of global commodity prices and India witnessing normal monsoon, concerns about any sharp spike in inflation or the current account deficit (CAD) are easing, a government source said on Thursday. The government, however, is not letting its guard down and is watchful of the evolving situation, the source added.

Despite having to bear additional fiscal burden, the Centre isn’t planning to slash the fertiliser subsidy rates at the moment, the source said. It doesn’t wish to add to farmers’ costs of production at this juncture. The government’s fertiliser subsidy bill is expected to exceed its FY23 Budget Estimate of Rs 1.05 trillion by about Rs 1.4 trillion, as global prices shot up in the wake of the Ukraine-Russia war.

The Centre is also unlikely to commit to extending the GST compensation for states beyond five years through FY22, acceding to some states’ demand, as any such decision will mean prolonging cess burden on consumers, said the source. “Will all the states be ready to say let’s keep the cess on the items in the 28% or 18% brackets for a much longer period to fund the GST compensation? These are things we all have to bear in mind,” said the source, indicating that the Centre isn’t going to take on extra burden on this front.

""",
    },
    {
      'image': Images.politicalmage,
      'details':
          """In the campaign for the Gujarat Assembly elections, the Aam Aadmi Party seems to be making a concerted push to woo traders and small businessmen and industrialists. On Wednesday, AAP convener Arvind Kejriwal addressed his third town hall in 10 days with them, this time in Ahmedabad.

Kejriwal had earlier held similar town halls in Rajkot and Jamnagar districts of Saurashtra, which are considered the state’s MSME hubs.

Also in Political Pulse |Arvind Kejriwal’s Saurashtra meetings set off buzz; businessmen attend, raise issues
At Rajkot on July 26, the first of these meetings, Kejriwal gave five ‘guarantees’ to the business community if voted to power in Gujarat: ending “an atmosphere of fear”, ensuring respect for them, weeding out corruption by way of doorstep delivery of government services, clearing pending VAT rebate pleas within six months, and simplifying GST. The Delhi CM also promised to make businessmen “partners in government” by forming a consultative committee comprising representatives from all business sectors.""",
    },
    {
      'image': Images.crimelmage,
      'details':
          """Ahmedabad: A man has been arrested for allegedly killing his 21-year-old drug addict son, chopping his body parts and disposing them off at two places in Gujarat's Ahmedabad city, police said on Sunday.
The accused, Nilesh Joshi, who was caught while fleeing to Nepal, was handed over to the crime branch on Saturday night, an official said.

A severed head, hands and legs were recovered from two places in the city on July 20 and 21, and it was found that they belonged to the same person, he said.

Based on technical and human intelligence, the crime branch officials zeroed in on Nilesh Joshi as a suspect in the case, the official said.

Nilesh Joshi had left Ahmedabad for Surat on a bus on July 22, and later boarded a train for Gorakhpur in his bid to escape to Nepal, he said.

The accused was detained by the Railway Protection Force (RPF) at Ganganagar railway station in Rajasthan on the basis of information shared by the crime branch, the official said.During interrogation, Nilesh Joshi revealed that he had killed his son Swayam who was addicted to drugs and alcohol, as he would get aggressive and quarrel with him all the time.

"On the morning of July 18, Swayam was high on drugs and was hurling abuses at his father for not giving him money. The victim also attacked his father with the wooden handle of a shovel. In the process, the accused kicked his son and hit his head with a stone six to seven times, killing him on the spot," the official said.

The accused then bought an electric grinder and large plastic bags to dispose off the body. He chopped off the head, legs and hands, dividing them into six parts and then placed them in plastic bags, he said.

Nilesh Joshi then carried the bags on a two-wheeler and threw them at two different places in the city, the official said.

Comments
The police are in the process of lodging an FIR under section 302 (murder) of the IPC against the accused, he added.""",
    },
    {
      'image': Images.religionlmage,
      'details':
          """STOCKTON, Calif. (RNS) — A joyous celebration honoring Our Lady of Guadalupe was well underway at Misión Latina Luterana last December when the Rev. Megan Rohrer, then-bishop of the Sierra Pacific Synod, announced to the Latino congregation that its pastor, the Rev. Nelson Rabell-González, had been fired.

After a few moments of confused chaos, the parishioners walked out, carrying their statue of the Virgin of Guadalupe with them. “The Virgin goes toward the front!” a woman advised as they left the sanctuary.

Rohrer — who had made history months before by being elected the first transgender bishop in the Evangelical Lutheran Church in America, the United States’ largest Lutheran denomination— stood by and watched the congregants leave. One parishioner asked the bishop, “Do you know what you’re doing?”Rohrer’s insensitivity in choosing to remove Rabell-González on Our Lady of Guadalupe’s feast day — a high point of Mexican Christianity — followed by the ham-handed handling of the aftermath by denominational leaders, “exposed the depth of systemic racism that we wrestle with as a church and in society,” said ELCA Presiding Bishop Elizabeth Eaton in an apology delivered Tuesday (Aug. 9) at the denomination’s triennial meeting in Columbus, Ohio.

Leaders of the denomination, which is 96% white, say they’re striving toward “becoming a multiethnic and multicultural church” as they grapple with the disruption.

What was truly demeaning, congregants told Religion News Service in a visit to the church last month, is that they were never taken into account. If church leaders truly felt their pastor posed a threat, why weren’t they properly informed about anything? 

And though the congregation walked out after Rohrer’s announcement on Dec. 12, its members say they were the ones who were eventually abandoned. With Rabell-González’s firing, the congregation lost its funding and support from the denomination.""",
    },
  ];

  bool read = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Column(
        children: [
          appbar(
            leadingIcon: Images.backIcon,
            title: widget.data[widget.index]['title'],
            actionIcon: Images.shareIcon,
            leadingontap: () {
              Get.back(result: const Blog_Screen());
            },
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child:
                        Image.asset("${full_Details[widget.index]['image']}")),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: appText(
                    maxLines: (read == true) ? null : 5,
                    fontWeight: FontWeight.w500,
                    color: (storeData == true) ? fontcolor : textcolor,
                    title: full_Details[widget.index]['details'],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (read == false) {
                      read = true;
                    } else {
                      read = false;
                    }
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: appText(
                      title: (read == true) ? "read less" : "Read More",
                      fontSize: 10,
                      color: fontcolor,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ))
        ],
      )),
    );
  }
}
