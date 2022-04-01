import 'package:bmi_calc2/layout/Franc_layout.dart';
import 'package:bmi_calc2/modules/login.dart';
import 'package:bmi_calc2/shared/components/components.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Datamdl {
  Datamdl({required this.img, required this.str1, required this.str2}) {}
  final ImageProvider img;
  final String str1;
  final String str2;
}

bool? isLast;

List<Datamdl> datamodel = [
  Datamdl(
      img: AssetImage(
        'lib/assets/brd1.png',
      ),
      str1: 'Buy now',
      str2: 'fast shipping'),
  Datamdl(
      img: AssetImage(
        'lib/assets/brd2.png',
      ),
      str1: 'Don\'t waste your time',
      str2: 'Buy with one click'),
  Datamdl(
      img: AssetImage(
        'lib/assets/brd3.png',
      ),
      str1: 'Find what you need easily',
      str2: 'Pay online'),
];

class onBoarding extends StatefulWidget {
  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  var Bcont = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {
                  NavigateAndDestroy(context, LoginScreen());
                },
                child: Text(
                  'Skip',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 88, 40, 246),
                  ),
                )),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      if (index == datamodel.length - 1) {
                        setState(() {
                          isLast = true;
                          print("islast$isLast");
                        });
                      } else {
                        setState(() {
                          isLast = false;
                          print("notislast$isLast");
                        });
                      }
                    },
                    itemBuilder: (context, index) =>
                        BuildPages(datamodel[index]),
                    itemCount: 3,
                    controller: Bcont,
                  ),
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: Bcont,
                      count: datamodel.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: const Color.fromARGB(255, 88, 40, 246),
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 4,
                        spacing: 0.5,
                        radius: 30,
                      ),
                    ),
                    Spacer(),
                    FloatingActionButton(
                        onPressed: () {
                          if (isLast == true) {
                            NavigateAndDestroy(context, LoginScreen());
                          } else {
                            Bcont.nextPage(
                                duration: Duration(milliseconds: 750),
                                curve: Curves.decelerate);
                          }
                        },
                        backgroundColor: const Color.fromARGB(255, 88, 40, 246),
                        child: Icon(
                          Icons.arrow_right_rounded,
                          size: 50,
                        ))
                  ],
                )
              ],
            )));
  }

  Widget BuildPages(Datamdl) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              alignment: Alignment.topCenter,
              image: Datamdl.img,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            Datamdl.str1,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            Datamdl.str2,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }
}
