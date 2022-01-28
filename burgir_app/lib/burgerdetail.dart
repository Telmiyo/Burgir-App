import 'dart:math';

import 'package:burgir_app/config.dart';
import 'package:flutter/material.dart';
import 'package:decorated_icon/decorated_icon.dart';

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
                    ),
                  ),
                  BurgerName(burger: burger),
                  const BurgerDescription('Description'),
                  const BurgerDetailedDescription(),
                  LikedButton(burger),
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

class LikedButton extends StatefulWidget {
  final Burger burger;
  const LikedButton(
    this.burger, {
    Key? key,
  }) : super(key: key);

  @override
  State<LikedButton> createState() => _LikedButtonState();
}

class _LikedButtonState extends State<LikedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: InkWell(
        onTap: () {
          setState(() {
            //Should indetify which burger is viewing the user
            burgerList[0].toggleLiked();
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
      margin: const EdgeInsets.all(0),
      child: Text(burger.name,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w600,
          )),
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
