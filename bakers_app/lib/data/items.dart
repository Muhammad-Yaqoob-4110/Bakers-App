import 'package:flutter/cupertino.dart';
import 'package:bakers_app/core/color.dart';

class Cakes {
  final String name;
  final String flavourl;
  final String image;
  final String price;
  final Color bgColor;
  final String destription;
  final double rating;

  Cakes({
    required this.name,
    required this.flavourl,
    required this.image,
    required this.price,
    required this.bgColor,
    required this.destription,
    required this.rating,
  });
}

List<Cakes> cakes = [
  Cakes(
    name: 'Princess Birthday Cake',
    flavourl: 'Creamy',
    price: '250.60',
    image: 'assets/images/01.png',
    bgColor: pink01,
    destription: 'Pricess Birthday Cake.',
    rating: 4.5,
  ),
  Cakes(
    name: 'Birthday Cake',
    flavourl: 'Creamy',
    image: 'assets/images/02.png',
    price: '220.60',
    bgColor: pink01,
    destription: 'Simple Birthday Cake',
    rating: 4,
  ),
  Cakes(
    name: 'Wedding Cake',
    flavourl: 'Creamy',
    price: '450.60',
    image: 'assets/images/03.png',
    bgColor: pink01,
    destription: 'A wedding Cake',
    rating: 2.5,
  ),
  Cakes(
    name: 'Cup Cake',
    flavourl: 'Creamy',
    image: 'assets/images/04.png',
    price: '850.60',
    bgColor: pink01,
    destription: 'Cup Cake',
    rating: 5,
  ),
];
