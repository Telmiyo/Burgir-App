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
      name: "Burger Buddies",
      imagePath: "assets/nft-icon.png",
      description:
          "Burger Buddies is a collection of 10,000 delicious NFT burgers, with all the ingredients prepared with love and care and randomly assembled. For those food lovers in the metaverse who know how to enjoy a good burger, you are invited to choose and collect the one that you find most delicious. Each one of these burgers are waiting to be eaten, with your family, friends or even alone. Or just you can just own it and admire it while your mouth keeps watering..",
      colors: [Colors.blue.shade200, Colors.green.shade400]),
  Character(
      name: "The Team",
      imagePath: "assets/telmo.jpeg",
      description: "Get and know the Team!",
      colors: [Colors.blue.shade200, Colors.grey.shade400]),
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
