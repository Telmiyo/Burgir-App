import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:burgir_app/config.dart';
import 'burger.dart';
import 'burgerdetail.dart';
import 'package:flutter/material.dart';

import 'config.dart';

List<Burger> burgerList = [];

// ignore: must_be_immutable
class Catalogue extends StatelessWidget {
  final dynamic doc;
  Catalogue(this.doc, {Key? key}) : super(key: key);
  final col =
      FirebaseFirestore.instance.collection("/Burgers/Catalogue/Borgirs");
  dynamic borgirs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Configurations.instance.CustomAppbar("Catalogue"),
      body: StreamBuilder(
        stream: col.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return Scaffold(
              body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 1 / 1.2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  maxCrossAxisExtent: 200,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (
                  BuildContext context,
                  index,
                ) {
                  borgirs = snapshot.data!.docs[index];
                  return BurgerCard(
                    Burger(
                      borgirs["ref"],
                      borgirs["name"],
                      borgirs["price"],
                      borgirs["link"],
                      borgirs["ilink"],
                      borgirs["wishlist"],
                      borgirs["offer"],
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text("doc is null!"));
          }
        },
      ),
    );
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
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Configurations.instance.secondaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 140,
                width: 140,
                child: Image.network(burger.img),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Configurations.instance.CustomText(
                burger.name,
                13,
                TextAlign.center,
                Configurations.instance.textColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Configurations.instance.CustomText(
                burger.price.toString() + ' ETH',
                13,
                TextAlign.center,
                Configurations.instance.textColor.withAlpha(
                  600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EmptyBurgerCard extends StatelessWidget {
  const EmptyBurgerCard({
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Configurations.instance.secondaryColor.withAlpha(0),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 140,
              width: 140,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
          ),
        ],
      ),
    );
  }
}
