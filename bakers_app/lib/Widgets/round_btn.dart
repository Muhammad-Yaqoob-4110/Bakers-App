import 'package:flutter/cupertino.dart';
import 'package:bakers_app/core/color.dart';

Widget roundButton({String? text, double? fontsize, double? height}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: height ?? 30.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Center(
        child: Text(
          text ?? 'Buy Now',
          style: TextStyle(
            fontSize: fontsize ?? 11.0,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
