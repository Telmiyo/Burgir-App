import 'package:cloud_firestore/cloud_firestore.dart';

import 'burger.dart';
import 'burgerdetail.dart';
import 'package:flutter/material.dart';

import 'catalogue.dart';
import 'config.dart';

List<Burger> burgerList = [];

class WishList extends StatelessWidget {
  final dynamic doc;
  WishList(this.doc, {Key? key}) : super(key: key);
  final col =
      FirebaseFirestore.instance.collection("/Burgers/Catalogue/Borgirs");
  dynamic borgirs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Configurations.instance.CustomAppbar("WishList"),
      body: StreamBuilder(
        stream: col.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            dynamic d = snapshot.data!.docs.length;
            return Scaffold(
              body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 20,
                  maxCrossAxisExtent: 200,
                ),
                //itemCount: snapshot.data!.docs.length,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (
                  BuildContext context,
                  index,
                ) {
                  borgirs = snapshot.data!.docs[index];

                  if (borgirs["wishlist"]) {
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
                  } else {
                    return EmptyBurgerCard();
                    return Container(
                      alignment: Alignment.center,
                      child: const Text("Empty"),
                    );
                  }
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
}
