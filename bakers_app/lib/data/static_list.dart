import 'package:flutter/material.dart';
import 'package:bakers_app/Core/images.dart';

class StaticLists {
  static List<Map<String, dynamic>> pagelist = [
    {
      'icon': (Icons.favorite),
      'title': 'Favourite List',
    },
    {
      'icon': (Icons.online_prediction_rounded),
      'title': 'Orders History',
    },
    {
      'icon': (Icons.wallet),
      'title': 'Wallet',
    },
    {
      'icon': (Icons.wind_power),
      'title': 'Promotion',
    },
    {
      'icon': (Icons.atm),
      'title': 'Payment Method',
    },
  ];

  //
  static List<Map<String, dynamic>> dateList = [
    {
      'day': 'Mon',
      'date': 4,
    },
    {
      'day': 'Tue',
      'date': 5,
    },
    {
      'day': 'Wed',
      'date': 6,
    },
    {
      'day': 'Thu',
      'date': 7,
    },
    {
      'day': 'Fri',
      'date': 8,
    },
    {
      'day': 'Sat',
      'date': 9,
    },
    {
      'day': 'Sun',
      'date': 10,
    },
  ];
  //
  static List<Map<String, dynamic>> timeList = [
    {
      'time': '0700 - 08:00',
      'delivery': '200',
    },
    {
      'time': '07:00 - 08:00',
      'delivery': '150',
    },
    {
      'time': '08:00 - 09:00',
      'delivery': 'Free',
    },
    {
      'time': '09:00 - 10:00',
      'delivery': 'Free',
    },
    {
      'time': '10:00 - 11:00',
      'delivery': '150',
    },
    {
      'time': '11:00 - 12:00',
      'delivery': 'Free',
    },
    {
      'time': '12:00 - 01:00',
      'delivery': 'Free',
    },
  ];
  //

  static List<Map<String, dynamic>> digitalPaymentList = [
    {
      'name': 'Master Card',
    },
    {
      'name': 'PayPal',
    },
    {
      'name': 'Payoneer',
    },
  ];
  //
  static List<Map<String, dynamic>> foodCategoryList = [
    {
      'img': Images.donut1,
      'title': 'Donut',
    },
    {
      'img': Images.cake,
      'title': 'Cake',
    },
    {
      'img': Images.bread,
      'title': 'Bread',
    },
    {
      'img': Images.pastries,
      'title': 'Pastries',
    },
    {
      'img': Images.cookies,
      'title': 'Cookies',
    },
    {
      'img': Images.pietarts,
      'title': 'Pie and Tarts',
    },
  ];

  static List<Map<String, dynamic>> sortByList = [
    {
      'img': Images.cake,
      'title': 'Kitchen Nearby',
      'filter': false,
    },
    {
      'img': Images.donut1,
      'title': 'Delivery Time',
      'filter': false,
    },
    {
      'img': Images.cake2,
      'title': 'Rating',
      'filter': false,
    },
  ];

  //
  static List<String> filterPrices = [
    '100',
    '200',
    '300',
    '500',
    '1000',
  ];
  //
  static List<Map<String, dynamic>> categoryList = [
    {
      'img': Images.cake,
      'title': 'Cakes',
    },
    {
      'img': Images.donut1,
      'title': 'Donuts',
    },
    {
      'img': Images.bread,
      'title': 'Breads',
    },
    {
      'img': Images.cake2,
      'title': 'Desert Loved',
    },
  ];
  //
  static List<Map<String, dynamic>> mCategoryList = [
    {
      'title': 'Cakes',
    },
    {
      'title': 'Donuts',
    },
    {
      'title': 'Cookies',
    },
  ];
  //
  static List<Map<String, dynamic>> gridItemsList = [
    {'title': 'Birthday Cake', 'img': Images.cake2},
    {'title': 'Stawberry Cake', 'img': Images.cake3},
    {
      'title': 'Donut',
      'img': Images.donut1,
    },
    {
      'title': 'Cookies',
      'img': Images.cookies,
    },
    {'title': 'Bread', 'img': Images.bread},
    {
      'title': 'Pies & tarts',
      'img': Images.pietarts,
    },
  ];
  //
  static List<Map<String, dynamic>> foodCategory = [
    {
      'title': 'All items',
    },
    {
      'title': 'Popular items',
    },
    {
      'title': 'All Kitchen',
    },
    {
      'title': 'Frequently Purchased',
    },
  ];
  //
  static List<Map<String, dynamic>> foodCategry = [
    {
      'title': 'All items',
    },
    {
      'title': 'Popular items',
    },
    {
      'title': 'All Kitchen',
    },
    {
      'title': 'Frequently Purchased',
    },
  ];
  //
  static List<Map<String, dynamic>> containerDataList = [
    {
      'img': Images.chiefHat,
      'title': 'Do you love to bake?',
    },
    {
      'img': Images.cartBag,
      'title': 'Do you love to eat?',
    }
  ];
}
