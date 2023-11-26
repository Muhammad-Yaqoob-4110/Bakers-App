import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bakers_app/core/color.dart';
import 'package:bakers_app/core/text_style.dart';
import 'package:bakers_app/data/category.dart';

class CategoryButton extends StatelessWidget {
  final Categories category;
  final int index;
  const CategoryButton({
    Key? key,
    required this.category,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      margin: const EdgeInsets.only(top: 30.0, right: 20.0),
      padding: index == category.id
          ? const EdgeInsets.only(left: 5.0, right: 10.0)
          : const EdgeInsets.symmetric(horizontal: 10.0),
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: index == category.id ? mainColor : pink01,
      ),
      child: index == category.id
          ? Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: white,
                  child: SvgPicture.asset(
                    category.image,
                    height: 20.0,
                  ),
                ),
                const SizedBox(width: 15.0),
                Text(
                  category.name,
                  style: txtBtnCategory,
                )
              ],
            )
          : SvgPicture.asset(
              category.image,
              height: 30.0,
            ),
    );
  }
}
