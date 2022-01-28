import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character(
      {required this.name,
      required this.imagePath,
      required this.description,
      required this.colors});
}

List characters = [
  Character(
      name: "What is Burger Buddies?",
      imagePath: "assets/logo.png",
      description:
          "Burger Buddies is a collection of 10,000 delicious NFT burgers, with all the ingredients prepared with love and care and randomly assembled. For those food lovers in the metaverse who know how to enjoy a good burger, you are invited to choose and collect the one that you find most delicious. Each one of these burgers are waiting to be eaten, with your family, friends or even alone. Or just you can just own it and admire it while your mouth keeps watering..",
      colors: [Colors.red, Colors.grey.shade400]),
  Character(
      name: "GiveAway!",
      imagePath: "assets/giveaway.jpg",
      description:
          "Sign up now to the giveaway. Take advantage now of the last opportunity to join the draw for a unique and special burger! Get your ticket buying any burger from our collection. On February 31st we will announce the result of the winner of our special Hamburger number #1563.!",
      colors: [Colors.pink.shade200, Colors.redAccent.shade400]),
  Character(
      name: "The Team",
      imagePath: "assets/aitor.jpeg",
      description: "Get and know the Team!",
      colors: [Colors.yellow.shade200, Colors.grey.shade400]),
  Character(
      name: "The Team",
      imagePath: "assets/marti.jpeg",
      description: "Get and know the Team!",
      colors: [Colors.red.shade200, Colors.grey.shade400])
];
