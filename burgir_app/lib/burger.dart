class Burger {
  final String name;
  // ignore: prefer_typing_uninitialized_variables
  final img;
  final link;
  final int kcal;
  bool wishlist;
  Burger(
    this.name,
    this.kcal,
    this.link,
    this.img,
    this.wishlist,
  );

  void toggleLiked() => wishlist = !wishlist;
}
