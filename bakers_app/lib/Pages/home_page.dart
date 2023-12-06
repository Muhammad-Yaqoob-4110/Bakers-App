import 'package:flutter/material.dart';
import 'package:bakers_app/core/color.dart';
import 'package:bakers_app/core/text_style.dart';
import 'package:bakers_app/data/category.dart';
import 'package:bakers_app/data/items.dart';
import 'package:bakers_app/Pages/details_page.dart';
import 'package:bakers_app/Widgets/category_btn.dart';
import 'package:bakers_app/Widgets/circular_btn.dart';
import 'package:bakers_app/Widgets/item_card.dart';
import 'package:bakers_app/Widgets/item_card_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //selected category index
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //title
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Will you have',
                            style: txtHeading,
                          ),
                          TextSpan(
                            text: '\nsome more',
                            style: txtHeading.copyWith(
                              color: grayColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: '\ncake',
                            style: txtHeading.copyWith(
                              color: black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //search button
                    CircleButton(
                      onTap: () {}, //to be implemented
                      image: 'search.svg',
                    )
                  ],
                ),
              ),
              //category menu widget
              categoryMenu(),
              Expanded(
                flex: 2,
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 50.0),
                    itemCount: cakes.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal, //horizontal list of items
                    itemBuilder: (itemBuilder, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  //route to detail page of selected item
                                  builder: (builder) =>
                                      DetailPage(cake: cakes[index])));
                        },
                        child: ItemCard(cake: cakes[index]),
                      );
                    }),
              ),
              //recommended section
              const Text(
                'Recommended',
                style: TextStyle(
                  fontSize: 21.0,
                  color: black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: cakes.length,
                    scrollDirection:
                        Axis.horizontal, //horizontal list of recommended items
                    padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                    itemBuilder: (itemBuilder, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: ItemCard02(cake: cakes[index]),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  categoryMenu() {
    return SizedBox(
      height: 80.0,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (itemBuilder, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                setState(() => selectIndex = index); //update selected index
              },
              //Category Button
              child: CategoryButton(
                category: category,
                index: selectIndex,
              ),
            );
          }),
    );
  }
}
