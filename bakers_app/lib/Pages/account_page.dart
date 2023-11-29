import 'dart:io';
import 'package:bakers_app/Controller/account_controller.dart';
import 'package:bakers_app/Core/color.dart';
import 'package:bakers_app/Core/images.dart';
import 'package:bakers_app/Widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bakers_app/data/static_list.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    const double defaultPadding = 15.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 20),
            child: Image.asset(
              Images.cartBag,
              height: s.height * 0.03,
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'My Account',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: s.height * 0.05,
          ),
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: 'Choose Image',
                titleStyle: Theme.of(context).textTheme.bodyMedium,
                content: Column(
                  children: [
                    ListTile(
                        onTap: () {
                          accountController.pickFromCamera();
                          Get.back();
                        },
                        title: const Text('Camera'),
                        leading: Image.asset(
                          Images.cameraIcon,
                          height: s.height * 0.04,
                        )),
                    ListTile(
                      onTap: () {
                        accountController.pickFromGallery();
                        Get.back();
                      },
                      title: const Text('Gallery'),
                      leading: Image.asset(
                        Images.galleryIcon,
                        height: s.height * 0.04,
                      ),
                    ),
                  ],
                ),
              );
            },
            child: SizedBox(
              height: s.height * 0.12,
              width: s.width * 0.26,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Obx(
                    () => CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
                      radius: 50,
                      backgroundImage: accountController.img.value == null
                          ? const AssetImage(Images.profilePic) as ImageProvider
                          : FileImage(
                              File(accountController.img.value!.path),
                            ),
                    ),
                  ),
                  const Positioned(
                    top: 60,
                    right: 0,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Color.fromARGB(255, 239, 239, 239),
                      child: Icon(
                        Icons.add,
                        color: appColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: s.height * 0.01,
          ),
          Text(
            '...',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: s.height * 0.005,
          ),
          Text(
            '..@gmail.com',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: grayColor, fontSize: 11, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: s.height * 0.03,
          ),
          const CustomDividerWidget(),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: Image.asset(
                    'assets/icons/platinum.png',
                    height: s.height * 0.07,
                  ),
                  title: Text(
                    'Plantinum',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color.fromARGB(255, 72, 124, 247),
                          fontSize: 15,
                        ),
                  ),
                  subtitle: const Text(
                    '245 Points',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SizedBox(
                  height: s.height * 0.07,
                  child: const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    color: Color.fromARGB(255, 238, 238, 238),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.star,
                        color: white,
                      ),
                    ),
                  ),
                  title: Text(
                    'RATING',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: appColor,
                          fontSize: 15,
                        ),
                  ),
                  subtitle: const Text(
                    '4.55',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const CustomDividerWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: SizedBox(
                width: s.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding:
                                EdgeInsets.only(bottom: index == 4 ? 0 : 10),
                            child: ListTile(
                              leading: Icon(
                                StaticLists.pagelist[index]['icon'],
                                color: grayColor,
                                size: 30,
                              ),
                              title: Text(
                                StaticLists.pagelist[index]['title'],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color:
                                          const Color.fromARGB(255, 79, 79, 79),
                                      fontSize: 17,
                                    ),
                              ),
                              trailing: const Icon(Icons.keyboard_arrow_right),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
