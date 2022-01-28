import 'package:burgir_app/config.dart';
import 'package:flutter/material.dart';

import 'character_widget.dart';

class CharacterListing extends StatefulWidget {
  const CharacterListing({Key? key}) : super(key: key);

  @override
  _CharacterListingState createState() => _CharacterListingState();
}

class _CharacterListingState extends State<CharacterListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Burger Buddies", style: Configurations.display1),
                    const TextSpan(text: "\n"),
                    TextSpan(
                        text: "A new way to introduce NFTs",
                        style: Configurations.display2)
                  ]))),
              const Expanded(
                child: CharacterWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
