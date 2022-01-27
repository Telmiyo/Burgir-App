import 'package:cloud_firestore/cloud_firestore.dart';

import 'burgerdetail.dart';
import 'package:flutter/material.dart';

import 'config.dart';

final configurations = Configurations();
List<Burger> burgerList = [];

class Catalogue extends StatelessWidget {
  final DocumentSnapshot doc;
  const Catalogue(this.doc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddBurgers(doc);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Catalogue", style: TextStyle(fontSize: 30)),
        ),
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
void AddBurgers(DocumentSnapshot doc) {
  burgerList.add(Burger(doc["Burger1"].toString(), 1, 1));
  burgerList.add(Burger("Burger #2", 1, 1));
  burgerList.add(Burger("Burger #3", 1, 1));
  burgerList.add(Burger("Burger #4", 1, 1));
  burgerList.add(Burger("Burger #5", 1, 1));
  burgerList.add(Burger("Burger #6", 1, 1));
  burgerList.add(Burger("Burger #7", 1, 1));
  burgerList.add(Burger("Burger #8", 1, 1));
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
        color: Colors.amber[600]!.withAlpha(80),
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
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(120),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 180,
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
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Burger {
  final String name;
  // ignore: prefer_typing_uninitialized_variables
  final img;
  final int kcal;
  Burger(
    this.name,
    this.kcal,
    this.img,
  );
}
