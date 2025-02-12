import 'dart:html' as html;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nriweb/constants/colorConstants.dart';
import 'package:nriweb/constants/constStyles.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});
  final _backgroundColor = ConstColors.mainColorOrange.withOpacity(0.1);

  static const _colors = [Colors.white, ConstColors.mainColorOrange];

  static const _durations = [
    5000,
    4000,
  ];
  void downloadFile(String url, String fileName) {
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", fileName)
      ..click();
  }

  static const _heightPercentages = [
    0.65,
    0.66,
  ];
  List<String> imagess = [
    "assets/images/eba.jpeg",
    "assets/images/nkwobi.jpg",
    "assets/images/indomieeee.jpg",
    "assets/images/jelloffff.jpeg",
    "assets/images/okraaa.jpg",
    "assets/images/afanggg.jpg",
    "assets/images/foodImage2.png",
    "assets/images/foodImage3.png",
    "assets/images/shawama.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        SizedBox(height: 10.h),
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/NriMainLogo.png",
                      )),
                  borderRadius: BorderRadius.circular(10.r)),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("  Nri", style: ConstStyles.SofiaProBold14Orange),
                Text("  Delivering your favourites food fast to your doorstep",
                    style: ConstStyles.SofiaProMedium11Grey3),
              ],
            ),
          ],
        ),
        ProductSlider(mainList: imagess),
        const Text(
            textAlign: TextAlign.center,
            "Welcome to Nri, A platform where we deliver to you your favourites delicacies straight to your doorstep click the button below to download the App",
            style: ConstStyles.SofiaProRegular15Black),
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: () {
            downloadFile(
                "https://dl.dropboxusercontent.com/scl/fi/doc3an1lr8j0ttrsu42z7/Nri.apk?rlkey=vdqtpwk0miyx7cc6fan03kbpz&st=dcfz7mfy",
                "Nri");
          },
          child: Container(
              decoration: BoxDecoration(
                  color: ConstColors.mainColorOrange,
                  borderRadius: BorderRadius.circular(30.r)),
              height: 70,
              width: 200,
              child: const Center(
                  child: Text("DOWNLOAD NOW",
                      style: ConstStyles.SofiaProBold20White))),
        ),
        Expanded(
          child: WaveWidget(
            config: CustomConfig(
              colors: _colors,
              durations: _durations,
              heightPercentages: _heightPercentages,
            ),
            // backgroundColor: _backgroundColor,
            size: const Size(double.infinity, double.infinity),
            waveAmplitude: 0,
          ),
        ),
      ],
    )));
  }
}

class ProductSlider extends StatefulWidget {
  const ProductSlider({
    super.key,
    required this.mainList,
  });

  final List<String> mainList;

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.mainList.map((i) {
        return GestureDetector(
          child: Container(
            width: double.infinity,
            // height: 350,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Product Image
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      //   image: DecorationImage(
                      //     image: AssetImage(i),
                      //     fit: BoxFit.cover,
                      //   ),
                      ),
                      child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20),

                        child: Image.asset(i, height: 200, fit: BoxFit.cover)),
                    ),

                    // Units Badge

                    // Favorite Icon
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 260,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        // pauseAutoPlayOnTouch: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
