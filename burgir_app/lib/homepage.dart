import 'catalogue.dart';
import 'whatis.dart';
import 'aboutus.dart';
import 'package:flutter/material.dart';
import 'config.dart';

final configurations = Configurations();

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  dynamic doc;
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
            const Header("Burger Buddies  Collection"),
            HomePageButton("What is Burger Buddies?",
                MaterialPageRoute(builder: (context) => WhatIs(doc))),
            HomePageButton("Catalogue",
                MaterialPageRoute(builder: (context) => Catalogue(doc))),
            HomePageButton("About Us",
                MaterialPageRoute(builder: (context) => const AboutUs())),
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
      margin: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 60,
      ),
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
      margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 60),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    );
  }
}
