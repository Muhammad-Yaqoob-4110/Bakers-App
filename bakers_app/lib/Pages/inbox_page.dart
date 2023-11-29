import 'package:bakers_app/Core/color.dart';
import 'package:bakers_app/Core/images.dart';
import 'package:bakers_app/Widgets/custom_divider.dart';
import 'package:bakers_app/Widgets/chat_widget.dart';
import 'package:bakers_app/Widgets/notification.dart';
import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              child: Image.asset(
                Images.searchIcon,
                height: s.height * 0.03,
              ),
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'Inbox',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        body: DefaultTabController(
          length: 2, // Number of tabs (Notifications and Chat)
          child: Column(
            children: [
              SizedBox(
                height: s.height * 0.02,
              ),
              const CustomDividerWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TabBar(
                  labelColor: appColor,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: appColor,
                  tabs: const [
                    Tab(
                      text: "Notifications",
                    ),
                    Tab(text: "Chat"),
                  ],
                ),
              ),
              const CustomDividerWidget(),
              const Expanded(
                child: TabBarView(
                  children: [
                    NotificationsWidget(),
                    ChatWidget(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
