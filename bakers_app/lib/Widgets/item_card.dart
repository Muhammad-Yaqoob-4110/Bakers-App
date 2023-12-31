import 'package:flutter/material.dart';
import 'package:bakers_app/core/color.dart';
import 'package:bakers_app/core/text_style.dart';
import 'package:bakers_app/data/items.dart';
import 'package:bakers_app/Widgets/circular_btn.dart';
import 'package:bakers_app/Widgets/round_btn.dart';

class ItemCard extends StatelessWidget {
  final Cakes cake;
  const ItemCard({Key? key, required this.cake}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0),
      width: 250.0,
      padding: const EdgeInsets.only(bottom: 20.0, left: 10.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 250.0,
              width: 250.0,
              padding:
                  const EdgeInsets.only(left: 20.0, right: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const [
                  BoxShadow(
                    color: blackShadow,
                    offset: Offset(0, 7),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cake.name,
                    maxLines: 1,
                    style: txtItemCard,
                  ),
                  const SizedBox(height: 7.0),
                  Text(
                    'Flavor: ${cake.flavourl}',
                    maxLines: 1,
                    style: txtItemCard.copyWith(
                      fontSize: 14,
                      color: grayColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$',
                              style: txtHeading.copyWith(fontSize: 12.0),
                            ),
                            TextSpan(
                              text: cake.price,
                              style: txtHeading.copyWith(fontSize: 17.0),
                            ),
                          ],
                        ),
                      ),
                      roundButton(),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 200.0,
              width: 220.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: pink02,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: Image.asset(
                cake.image,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: CircleButton(
              size: 30.0,
              iconColor: mainColor,
              onTap: () {},
              image: 'heart_full.svg',
            ),
          )
        ],
      ),
    );
  }
}
