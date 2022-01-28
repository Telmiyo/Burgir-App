import 'package:burgir_app/AboutUs/character.dart';
import 'package:burgir_app/config.dart';
import 'package:flutter/material.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:url_launcher/link.dart';

import 'AboutUs/character_widget.dart';

class AboutUs extends StatefulWidget {
  final dynamic doc;

  const AboutUs(this.doc, {Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Configurations.instance.CustomAppbar("About Us"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 8.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Burger Buddies", style: Configurations.display1),
                    const TextSpan(text: "\n"),
                    TextSpan(
                        text: "A new way to introduce NFTs",
                        style: Configurations.display2)
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  for (var i = 0; i < characters.length; i++)
                    CharacterWidget(character: characters[i]),
                  MeetTheTeam(widget.doc),
                ],
              ),
            ),
          ],
        ));
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
      alignment: Alignment.center,
      child: Configurations.instance.CustomText(
        "Meet the team behind",
        10.0,
        TextAlign.center,
        Configurations.instance.textColor,
      ),
    );
  }
}

class MeetTheTeam extends StatelessWidget {
  final dynamic doc;
  const MeetTheTeam(
    this.doc, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ProfileMiniature(
              Colors.red,
              "Aitor",
              "The engineer",
              "Aitor is in charge of working on the connection with the database and the use of it.",
              'assets/aitor.jpeg',
            ),
            ProfileMiniature(
              Colors.blue,
              "Telmo",
              "Designer & Programmer",
              "He has been in charge of making the design and programming section",
              'assets/telmo.jpeg',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ProfileMiniature(
              Colors.green,
              "Marti",
              "Designer & Programmer",
              "He also has been in charge of making the design and programming section",
              'assets/marti.jpeg',
            ),
            WorkWithUsMiniature(
              Colors.amber,
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileMiniature extends StatelessWidget {
  final Color color;
  final String name;
  final String alias;
  final String description;
  // ignore: prefer_typing_uninitialized_variables
  final profileImage;
  const ProfileMiniature(
    this.color,
    this.name,
    this.alias,
    this.description,
    this.profileImage, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Container(
        height: 120,
        width: 120,
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          child: CircleAvatar(
            backgroundImage: AssetImage(profileImage),
          ),
          onTap: () {
            // ignore: avoid_print
            print("tapped profile");
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DeveloperCard(
                  color,
                  name,
                  alias,
                  description,
                  profileImage,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class WorkWithUsMiniature extends StatelessWidget {
  final Color color;
  const WorkWithUsMiniature(
    this.color, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Container(
        alignment: Alignment.center,
        height: 120,
        width: 120,
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          child: Container(
            alignment: Alignment.center,
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(100),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const DecoratedIcon(
              Icons.add,
              size: 70,
              color: Colors.black,
              shadows: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 3.0),
                ),
              ],
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Burger Buddies is recruiting!'),
                content: const Text('Do you want to join the team?'),
                actions: <Widget>[
                  Link(
                    uri: Uri.parse(
                        'https://www.instagram.com/burgerbuddiesnft/?hl=es'),
                    builder: (context, followLink) => ElevatedButton(
                      onPressed: followLink,
                      child: const Text('Contact with us!'),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Not sure...'),
                    onPressed: () {
                      Navigator.of(context).pop('Cancel');
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  final Color color;
  final String name;
  final String alias;
  final String description;
  // ignore: prefer_typing_uninitialized_variables
  final profileImage;
  const DeveloperCard(
    this.color,
    this.name,
    this.alias,
    this.description,
    this.profileImage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meet the team"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 300,
              child: Image(
                image: AssetImage(profileImage),
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              alias,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.black.withAlpha(100),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
