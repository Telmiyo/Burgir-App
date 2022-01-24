import 'package:flutter/material.dart';

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
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(80),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                  decoration: BoxDecoration(
                    color: configurations.mainColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  height: 520,
                  width: 500,
                ),
                Container(
                  margin: const EdgeInsets.all(0),
                  child: Text(burger.name,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text("Burger description",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "More Burger description",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            margin: const EdgeInsets.fromLTRB(40, 110, 40, 10),
            decoration: BoxDecoration(
              color: configurations.mainColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Row(
              children: const [
                BarButton(Icons.arrow_left, previousBurger),
                BarButton(Icons.shuffle, randomBurger),
                BarButton(Icons.arrow_right, nextBurger),
              ],
            ),
          ),
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
      child: InkWell(
        onTap: () {
          method();
        },
        hoverColor: Colors.red,
        child: Icon(icon, color: Colors.black, size: 45),
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
