import 'package:bakers_app/data/static_list.dart';
import 'package:bakers_app/Core/color.dart';
import 'package:bakers_app/Core/images.dart';
import 'package:bakers_app/Widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var initialFoodSelected = 0.obs;
  var initialCategorySelected = 0.obs;

  void mButtonSwitch(int index) {
    initialFoodSelected.value = index;
  }

  // categorySelection

  void fButtonSwitch(int index) {
    initialCategorySelected.value = index;
  }
  // Griditems
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    const double defaultPadding = 16.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        automaticallyImplyLeading: false, //remove back option in appBar
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Search',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: s.height * 0.03,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextFieldWidget(
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500, color: mediumGrayColor),
                contentPadding: const EdgeInsets.only(top: 15),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: SizedBox(
                  width: s.width * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: s.height * 0.045,
                        width: s.width * 0.004,
                        color: const Color.fromARGB(255, 209, 209, 209),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            //pending implementation
                            //Get.to(const SearchFilterPage());
                          },
                          child: Image.asset(
                            Images.filterIcon,
                            color: appColor,
                            height: s.height * 0.032,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Image.asset(
                    Images.searchIcon,
                    color: appColor,
                    height: s.height * 0.03,
                  ),
                ),
                hintTextColor: mediumGrayColor,
                // inputBorder: InputBorder.none,
                textfiledColor: const Color.fromARGB(255, 232, 232, 232),
                hintText: 'Search for Cakes, Desserts...',
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            Obx(
              () => Wrap(
                children:
                    List.generate(StaticLists.mCategoryList.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      searchController.mButtonSwitch(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: defaultPadding),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: searchController.initialFoodSelected.value ==
                                    index
                                ? Colors.transparent
                                : textFieldGrayColor),
                        borderRadius: BorderRadius.circular(30),
                        color: searchController.initialFoodSelected.value ==
                                index
                            ? appColor
                            : white, // Set the desired color of the circular container
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding, vertical: 10),
                        child: Text(
                          StaticLists.mCategoryList[index]['title'],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 12,
                                  color: searchController
                                              .initialFoodSelected.value ==
                                          index
                                      ? white
                                      : black),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Obx(
              () => Wrap(
                children:
                    List.generate(StaticLists.foodCategoryList.length, (index) {
                  return TextButton(
                    onPressed: () {
                      searchController.fButtonSwitch(index);
                    },
                    child: Text(
                      StaticLists.foodCategoryList[index]['title'],
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight:
                              searchController.initialCategorySelected.value ==
                                      index
                                  ? FontWeight.bold
                                  : FontWeight.w400,
                          color:
                              searchController.initialCategorySelected.value ==
                                      index
                                  ? black
                                  : mediumGrayColor),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: s.height * 0.01,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    mainAxisExtent: 155),
                itemCount: StaticLists
                    .gridItemsList.length, // Total number of items in the grid
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage(
                              StaticLists.gridItemsList[index]['img']),
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.darken,
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Text(
                        StaticLists.gridItemsList[index]['title'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
