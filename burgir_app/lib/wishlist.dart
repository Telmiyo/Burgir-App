import 'burger.dart';
import 'burgerdetail.dart';
import 'package:flutter/material.dart';

import 'config.dart';

final configurations = Configurations();
List<Burger> burgerList = [];

class WishList extends StatelessWidget {
  final dynamic doc;
  const WishList(this.doc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddBurgers(doc);
    return Scaffold(
        body: Scrollbar(
      child: GridView.count(
        childAspectRatio: 2 / 2.2,
        crossAxisCount: 2,
        children: [
          for (int i = 0; i < burgerList.length; i++) BurgerCard(burgerList[i])
        ],
      ),
    ));
  }
}

// ignore: non_constant_identifier_names
void AddBurgers(dynamic doc) {
  burgerList.add(Burger(doc['Burger1'], 1, 1, true));
  burgerList.add(Burger("Burger #2", 1, 1, true));
}

class BurgerCard extends StatelessWidget {
  final Burger burger;
  const BurgerCard(
    this.burger, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: configurations.mainColor.withAlpha(150),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: InkWell(
        onTap: () {
          debugPrint("Burger card tapped");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BurgerDetails(burger),
            ),
          );
        },
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(
                30,
                30,
                30,
                15,
              ),
              decoration: BoxDecoration(
                color: configurations.secondaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 140,
              width: 180,

              //child: Image(
              //image: NetworkImage(
              //"https://github.com/MartiDavicino/Flutter-App_Mobile-Devices/blob/main/App%20prototype/app_prototype/assets/1.png"),
              //image: AssetImage("assets/" + img.toString() + "png"),
              //),
            ),
            Text(
              burger.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
