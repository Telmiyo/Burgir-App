import 'package:burgir_app/config.dart';

import 'burger.dart';
import 'burgerdetail.dart';
import 'package:flutter/material.dart';

List<Burger> burgerList = [];

class Catalogue extends StatelessWidget {
  final dynamic doc;
  const Catalogue(this.doc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    burgerList.clear();
    AddBurgers(doc);
    return Scaffold(
        appBar: Configurations.instance.CustomAppbar("Burgers Catalogue"),
        body: Scrollbar(
          child: GridView.count(
            childAspectRatio: 2 / 2.2,
            crossAxisCount: 2,
            children: [
              for (int i = 0; i < burgerList.length; i++)
                BurgerCard(burgerList[i])
            ],
          ),
        ));
  }
}

// ignore: non_constant_identifier_names
void AddBurgers(dynamic doc) {
  burgerList.add(Burger("Burger #1", 1, 1, false));
  burgerList.add(Burger("Burger #2", 1, 1, false));
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
        color: Configurations.instance.mainColor.withAlpha(150),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(
                  30,
                  30,
                  30,
                  15,
                ),
                decoration: BoxDecoration(
                  color: Configurations.instance.secondaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 140,
                width: 180,
              ),
            ),
            Configurations.instance.CustomText(burger.name, TextAlign.center),
          ],
        ),
      ),
    );
  }
}
