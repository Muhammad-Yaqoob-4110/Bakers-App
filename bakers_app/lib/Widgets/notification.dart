import 'package:bakers_app/Core/color.dart';
import 'package:bakers_app/Widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    const double defaultPadding = 15.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding, top: 10),
          child: Text(
            'Active Orders',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        SizedBox(
          height: s.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.blue[200],
                backgroundImage: const AssetImage(
                  'assets/images/04.png',
                ),
              ),
              SizedBox(
                width: s.width * 0.05,
              ),
              RichText(
                text: TextSpan(
                  text: 'Cup Cakes',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n3 items Order ID #023481',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    TextSpan(
                      text: '\nNov 2, 11:30 am',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Rs ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: appColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: '499',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 226, 226, 226)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          'View Order',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding),
          child: CustomDividerWidget(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding),
          child: Text(
            'Past Orders',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
