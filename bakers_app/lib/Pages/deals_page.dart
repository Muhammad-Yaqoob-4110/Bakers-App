import 'package:bakers_app/Core/color.dart';
import 'package:bakers_app/data/scroll_deals.dart';
import 'package:bakers_app/Widgets/custom_divider.dart';
import 'package:bakers_app/Widgets/scroll_deals.dart';
import 'package:flutter/material.dart';

class DealsPage extends StatelessWidget {
  const DealsPage({super.key, Key? key1});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    const double defaultPadding = 13.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Best Deals',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: s.height * 0.02,
          ),
          const CustomDividerWidget(),
          SizedBox(
            height: s.height * 0.02,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              itemCount: ScrollDealsModel.scrollDealsList.length,
              // Number of containers in the list
              itemBuilder: (context, index) {
                final items = ScrollDealsModel.scrollDealsList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: DealsWidget(
                    s: s,
                    items: items,
                    index: index,
                    right: 0,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
