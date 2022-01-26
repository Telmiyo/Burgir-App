import 'package:cloud_firestore/cloud_firestore.dart';

import 'catalogue.dart';
import 'aboutus.dart';
import 'newaboutus.dart';
import 'package:flutter/material.dart';
import 'config.dart';

final configurations = Configurations();

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  List<QueryDocumentSnapshot<Object?>> doc;
  HomePage(this.doc, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Burger Collection"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Header("Burger Collection"),
            HomePageButton("About Us",
                MaterialPageRoute(builder: (context) => AboutUs(doc[0]))),
            HomePageButton("New About Us",
                MaterialPageRoute(builder: (context) => const NewAboutUs())),
            HomePageButton("Catalogue",
                MaterialPageRoute(builder: (context) => Catalogue(doc[1]))),
          ],
        ),
      ),
    );
  }
}

class HomePageButton extends StatelessWidget {
  final String text;
  final MaterialPageRoute route;
  const HomePageButton(
    this.text,
    this.route, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      margin: const EdgeInsets.fromLTRB(0, 60, 0, 60),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: configurations.mainColor,
        ),
        onPressed: () {
          Navigator.of(context).push(route);
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String text;
  const Header(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 70, 0, 90),
      child: Text(
        text,
        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
      ),
    );
  }
}
