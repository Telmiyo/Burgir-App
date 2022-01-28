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
                itemCount: 8,
                itemBuilder: (
                  BuildContext context,
                  index,
                ) {
                  borgirs = snapshot.data!.docs[index];

                  if (borgirs["wishlist"]) {
                    return BurgerCard(
                      Burger(
                        borgirs["name"],
                        borgirs["price"],
                        borgirs["link"],
                        borgirs["ilink"],
                        borgirs["wishlist"],
                        borgirs["offer"],
                      ),
                    );
                  } else {
                    return BurgerCard(
                      Burger(
                          "Empty",
                          "price",
                          "https://opensea.io/collection/burger-buddies-collection",
                          "https://www.creativefabrica.com/wp-content/uploads/2021/03/12/empty-box-icon-for-your-project-Graphics-9511703-1.jpg",
                          false,
                          Timestamp(0, 0)),
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
