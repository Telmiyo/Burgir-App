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
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: configurations.secondaryColor,
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
                        color: configurations.mainColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      height: 250,
                      width: 250,
                    ),
                  ),
                  BurgerName(burger: burger),
                  const BurgerDescription(),
                  const BurgerDetailedDescription(),
                  LikedButton(burger)
                ],
              ),
            ),
          ),
          const BottomBar(),
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
            burgerList[0].toggleLiked();
          });
        },
        child: DecoratedIcon(
          widget.burger.wishlist ? Icons.favorite : Icons.favorite_outline,
          size: 40,
          color: configurations.mainColor,
          shadows: [
            BoxShadow(
              color: configurations.shadowColor,
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
  const BurgerDescription({
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

class BottomBar extends StatelessWidget {
  const BottomBar({
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
        color: configurations.secondaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          BarButton(Icons.arrow_left, previousBurger),
          BarButton(Icons.shuffle, randomBurger),
          BarButton(Icons.arrow_right, nextBurger),
        ],
      ),
    );
  }
}

class BarButton extends StatelessWidget {
  final IconData icon;
  final void Function() method;
  const BarButton(
    this.icon,
    this.method, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            method();
          },
          hoverColor: Colors.red,
          child: DecoratedIcon(
            icon,
            color: configurations.mainColor,
            size: 45,
            shadows: [
              BoxShadow(
                color: configurations.shadowColor,
                offset: const Offset(0.0, 3.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void nextBurger() {
  debugPrint("Next burger");
  //Navigator.of(context).push(
  //  MaterialPageRoute(
  //    builder: (context) => BurgerDetails(burgerList[3]),
  //  ),
  //);
}

void previousBurger() {
  debugPrint("Previous burger");
}

void randomBurger() {
  debugPrint("Random burger");
  //Random random = Random();
  //int randomNumber = random.nextInt(burgerList.length);
}
