import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:burgir_app/config.dart';
import 'burger.dart';
import 'burgerdetail.dart';
import 'package:flutter/material.dart';

import 'config.dart';

List<Burger> burgerList = [];

class Catalogue extends StatelessWidget {
  final dynamic doc;
  Catalogue(this.doc, {Key? key}) : super(key: key);
  final col = FirebaseFirestore.instance.collection("Borgirs");
  dynamic borgirs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: col.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            dynamic d = snapshot.data!.docs.length;
            return Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, index) {
                  borgirs = snapshot.data!.docs[index];
                  String name = borgirs["name"];
                  return GridView.count(
                      childAspectRatio: 2 / 2.2,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: [
                        for (int i = 0; i < burgerList.length; i++)
                          BurgerCard(burgerList[i])
                      ]);
                },
              ),
            );
          } else {
            return const Center(child: Text("doc is null!"));
          }
        },
      ),
    );
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
  //AddBurgers(doc);
  // return Scaffold(
  //     body: Scrollbar(
  //   child: GridView.count(
  //     childAspectRatio: 2 / 2.2,
  //     crossAxisCount: 2,
  //     shrinkWrap: true,
  //     children: [
  //       //for (int i = 0; i < burgerList.length; i++) BurgerCard(burgerList[i])
  //     ],
  //   ),
  // ));

}

// ignore: non_constant_identifier_names
void AddBurgers(dynamic doc) {
  // burgerList.add(Burger("Burger #1", 1, 1, false));
  // burgerList.add(Burger("Burger #2", 1, 1, false));
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

              //child: Image(
              //image: NetworkImage(
              //"https://github.com/MartiDavicino/Flutter-App_Mobile-Devices/blob/main/App%20prototype/app_prototype/assets/1.png"),
              //image: AssetImage("assets/" + img.toString() + "png"),
              //),
            )),
            Text(
              burger.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Configurations.instance.CustomText(burger.name, TextAlign.center),
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
