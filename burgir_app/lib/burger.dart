import 'package:cloud_firestore/cloud_firestore.dart';

class Burger {
  String bref;
  final String name;
  // ignore: prefer_typing_uninitialized_variables
  final img;
  // ignore: prefer_typing_uninitialized_variables
  final link;
  // ignore: prefer_typing_uninitialized_variables
  final price;
  final Timestamp offer;
  bool wishlist;
  Burger(
    this.bref,
    this.name,
    this.price,
    this.link,
    this.img,
    this.wishlist,
    this.offer,
  );

  void toggleLiked() => wishlist = !wishlist;
}
