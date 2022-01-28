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
              margin: const EdgeInsets.all(40),
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
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                      decoration: BoxDecoration(
                        color: Configurations.instance.mainColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      height: 250,
                      width: 250,
                      child: Image.network(burger.img),
                    ),
                  ),
                  BurgerName(burger: burger),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 0,
                    ),
                    child: Description(burger: burger),
                  ),
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

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.burger,
  }) : super(key: key);

  final Burger burger;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.topRight,
        // width: double.infinity,
        // margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: InkWell(
          onTap: () {
            setState(() {
              !burgir.wishlist;
            });
          },
          child: DecoratedIcon(
            widget.burger.wishlist ? Icons.favorite : Icons.favorite_outline,
            size: 40,
            color: Configurations.instance.mainColor,
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
      height: 100,
      margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      //padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
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
            size: 45,
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
