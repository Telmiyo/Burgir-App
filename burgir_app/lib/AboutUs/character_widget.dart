import 'package:burgir_app/AboutUs/character.dart';
import 'package:burgir_app/config.dart';
import 'package:flutter/material.dart';

import 'character_detail_screen.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeigh = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 350),
                pageBuilder: (context, _, __) =>
                    CharacterDetailScreen(character: characters[0])));
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CharacterCardBackgroundClipper(),
              child: Hero(
                tag: "background-${characters[0].name}",
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.5),
                  height: 0.55 * screenHeigh,
                  width: 0.9 * screenWidth,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: characters[0].colors,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 35),
            child: Hero(
              tag: "image-${characters[0].name}",
              child: Image.asset(
                characters[0].imagePath,
                height: screenHeigh * 0.55,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Hero(
                  tag: "name-${characters[0].name}",
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      child: Text(
                        characters[0].name,
                        style: Configurations.h1,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Tap to Read More",
                  style: Configurations.h2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
