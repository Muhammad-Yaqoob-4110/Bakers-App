import 'package:bakers_app/Controller/bottom_navigation_controller.dart';
import 'package:bakers_app/Pages/home_page.dart';
import 'package:bakers_app/Core/color.dart';
import 'package:bakers_app/Core/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  BottomNavigationPage({super.key});

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            unselectedItemColor: hintTextColor,
            selectedItemColor: appColor,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.exploreIcon,
                    height: MediaQuery.of(context).size.height * 0.03,
                    color: appColor,
                  ),
                ),
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.exploreIcon,
                    height: MediaQuery.of(context).size.height * 0.03,
                    color: grayColor,
                  ),
                ),
                label: 'Explore',
                backgroundColor: white,
              ),
              BottomNavigationBarItem(
                backgroundColor: white,
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.searchIcon,
                    color: appColor,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.searchIcon,
                    color: grayColor,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.dealsIcon,
                    color: appColor,
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                ),
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.dealsIcon,
                    color: grayColor,
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                ),
                label: 'Deals',
                backgroundColor: white,
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.inboxIcon,
                    color: appColor,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.inboxIcon,
                    color: grayColor,
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                ),
                label: 'Inbox',
                backgroundColor: white,
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.accountIcon,
                    color: appColor,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.accountIcon,
                    color: grayColor,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                label: 'Account',
                backgroundColor: white,
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationController landingPageController =
        Get.put(BottomNavigationController(), permanent: false);
    return Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: const [
              HomePage(),
              //SearchScreen(),
              //DealsScreen(),
              //InboxScreen(),
              //AccountScreen(),
            ],
          )),
    );
  }
}
