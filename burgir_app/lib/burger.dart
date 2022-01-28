import 'package:cloud_firestore/cloud_firestore.dart';

class Burger {
  final String name;
  // ignore: prefer_typing_uninitialized_variables
  final img;
  final link;
  final price;
  final Timestamp offer;
  bool wishlist;
  Burger(
    this.name,
    this.price,
    this.link,
    this.img,
    this.wishlist,
    this.offer,
  );

  void toggleLiked() => wishlist = !wishlist;
}
