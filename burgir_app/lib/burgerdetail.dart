import 'dart:math';

import 'package:burgir_app/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:url_launcher/link.dart';

import 'burger.dart';
import 'catalogue.dart';

class BurgerDetails extends StatelessWidget {
  final Burger burger;

  const BurgerDetails(this.burger, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Configurations.instance.CustomAppbar(""),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 40,
              ),
              decoration: BoxDecoration(
                color: Configurations.instance.secondaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: BurgerImage(burger: burger),
                  ),
                  Description(burger: burger),
                ],
              ),
            ),
          ),
          BottomBar(burger),
        ],
      ),
    );
  }
}

class BurgerImage extends StatelessWidget {
  const BurgerImage({
    Key? key,
    required this.burger,
  }) : super(key: key);

  final Burger burger;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Configurations.instance.mainColor.withAlpha(150),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 250,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox.fromSize(
          size: const Size.fromRadius(50),
          child: Image.network(
            burger.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.burger,
  }) : super(key: key);

  final Burger burger;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(80),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 25,
      ),
      child: Column(
        children: [
          BurgerName(burger: burger),
          Row(
            children: [
              Price(burger),
              LikedButton(burger),
            ],
          ),
          Row(
            children: [
              BuyNow(burger),
              Offer(burger),
            ],
          ),
        ],
      ),
    );
  }
}

class BuyNow extends StatelessWidget {
  final Burger burger;
  const BuyNow(
    this.burger, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Link(
        uri: Uri.parse(burger.link),
        builder: (context, followLink) => ElevatedButton(
          onPressed: followLink,
          child: Configurations.instance.CustomText(
            'Buy now',
            13,
            TextAlign.center,
            Configurations.instance.textColor,
          ),
        ),
      ),
    );
  }
}

class Offer extends StatefulWidget {
  final Burger burger;
  const Offer(
    this.burger, {
    Key? key,
  }) : super(key: key);

  @override
  State<Offer> createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  @override
  Widget build(BuildContext context) {
    int getRemainingDays(DateTime dateComparision) {
      DateTime currentDate = DateTime.now();

      int remaingDays = dateComparision.difference(currentDate).inDays;
      return remaingDays;
    }

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Configurations.instance.CustomText(
          'Offer ends\nin ' +
              getRemainingDays(widget.burger.offer.toDate()).toString() +
              ' days',
          10,
          TextAlign.right,
          Configurations.instance.textColor,
        ),
        // child: Configurations.instance.CustomText(
        //   'Offer ends\nin ' + burger.offer.toDate().day.toString() + ' days',
        //   10,
        //   TextAlign.right,
        //   Configurations.instance.textColor,
        // ),
      ),
    );
  }
}

class Price extends StatelessWidget {
  final Burger burger;
  const Price(
    this.burger, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Configurations.instance.CustomText(
        burger.price.toString() + ' ETH',
        19,
        TextAlign.center,
        Configurations.instance.textColor,
      ),
    );
  }
}

class LikedButton extends StatefulWidget {
  final Burger burger;
  const LikedButton(
    this.burger, {
    Key? key,
  }) : super(key: key);

  @override
  State<LikedButton> createState() => _LikedButtonState(burger);
}

class _LikedButtonState extends State<LikedButton> {
  final Burger burgir;
  _LikedButtonState(this.burgir);
  final ber =
      FirebaseFirestore.instance.collection("/Burgers/Catalogue/Borgirs");
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: ber.snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return InkWell(
                onTap: () {
                  debugPrint("clicked");
                  if (burgir.wishlist == false) {
                    ber.doc(burgir.bref).update({'wishlist': true});
                  }
                  if (burgir.wishlist == true) {
                    ber.doc(burgir.bref).update({'wishlist': false});
                  }
                },
                child: DecoratedIcon(
                  widget.burger.wishlist
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  size: 30,
                  color: Configurations.instance.mainColor,
                  shadows: [
                    BoxShadow(
                      color: Configurations.instance.shadowColor,
                      offset: const Offset(0.0, 3.0),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("doc is null!"));
            }
          }),
    );
  }
}

class BurgerDetailedDescription extends StatelessWidget {
  const BurgerDetailedDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: const Text(
        "More Burger description",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class BurgerDescription extends StatelessWidget {
  final String description;
  const BurgerDescription(
    this.description, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: const Text("Burger description",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
          )),
    );
  }
}

class BurgerName extends StatelessWidget {
  const BurgerName({
    Key? key,
    required this.burger,
  }) : super(key: key);

  final Burger burger;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        10,
        0,
        10,
        40,
      ),
      child: Configurations.instance.CustomText(
        burger.name,
        29,
        TextAlign.center,
        Configurations.instance.textColor,
      ),
    );
  }
}

// ignore: must_be_immutable
class BottomBar extends StatelessWidget {
  Burger burgerAt;
  BottomBar(
    this.burgerAt, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85,
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 0,
      ),
      decoration: BoxDecoration(
        color: Configurations.instance.secondaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BarButton(Icons.arrow_left, previousBurger, burgerAt),
          BarButton(Icons.shuffle, randomBurger, burgerAt),
          BarButton(Icons.arrow_right, nextBurger, burgerAt),
        ],
      ),
    );
  }
}

class BarButton extends StatelessWidget {
  final IconData icon;
  final Burger burgerAt;
  final void Function(BuildContext context, Burger burgerAt) method;
  const BarButton(
    this.icon,
    this.method,
    this.burgerAt, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            method(context, burgerAt);
          },
          hoverColor: Colors.red,
          child: DecoratedIcon(
            icon,
            color: Configurations.instance.mainColor,
            size: 35,
            shadows: [
              BoxShadow(
                color: Configurations.instance.shadowColor,
                offset: const Offset(0.0, 3.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void nextBurger(BuildContext context, Burger burgerAt) {
  debugPrint("Next burger");
  for (int i = 0; i < burgerList.length; ++i) {
    if (burgerList[i] == burgerAt && i + 1 < burgerList.length) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BurgerDetails(burgerList[i + 1]),
      ));
    }
  }
}

void previousBurger(BuildContext context, Burger burgerAt) {
  debugPrint("Previous burger");
  for (int i = 0; i < burgerList.length; ++i) {
    if (burgerList[i] == burgerAt && i - 1 > 0) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BurgerDetails(burgerList[i - 1]),
      ));
    }
  }
}

void randomBurger(BuildContext context, Burger burgerAt) {
  debugPrint("Random burger");
  int n = Random().nextInt(burgerList.length);
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => BurgerDetails(burgerList[n]),
  ));
}
