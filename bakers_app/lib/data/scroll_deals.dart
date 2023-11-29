import 'package:bakers_app/Core/color.dart';
import 'package:bakers_app/Core/images.dart';
import 'package:flutter/material.dart';

class ScrollDealsModel {
  final String titleTxt;
  final String tagTitle;
  final Color btnColor;
  final String img;
  final Color backgroundColor;
  ScrollDealsModel(
      {required this.btnColor,
      required this.img,
      required this.tagTitle,
      required this.titleTxt,
      required this.backgroundColor});

  static List<ScrollDealsModel> scrollDealsList = [
    ScrollDealsModel(
        btnColor: white,
        img: Images.bread,
        tagTitle: '20%',
        titleTxt: 'On your first order!',
        backgroundColor: Colors.black),
    ScrollDealsModel(
        btnColor: const Color.fromARGB(255, 255, 213, 246),
        img: Images.pietarts,
        tagTitle: '25%',
        titleTxt: "Every sunday special dish\nfrom my bakery!",
        backgroundColor: const Color.fromARGB(255, 250, 16, 172)),
    ScrollDealsModel(
      btnColor: const Color.fromARGB(255, 255, 224, 130),
      img: Images.cake3,
      tagTitle: '10%',
      titleTxt: "Onboarding orders you'll\nget discount",
      backgroundColor: const Color.fromARGB(255, 14, 123, 112),
    ),
  ];
}
