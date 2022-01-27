import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About us"),
      ),
      body: Column(
        children: const [
          Header(),
          MeetTheTeam(),
        ],
      ),
    );
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
      child: const Text(
        "Meet the team behind",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class MeetTheTeam extends StatelessWidget {
  const MeetTheTeam({
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
              "Des",
              'assets/aitor.jpeg',
            ),
            ProfileMiniature(
              Colors.blue,
              "Telmo",
              "The latifundist",
              "Des",
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
              "The UI master",
              "Des",
              'assets/marti.jpeg',
            ),
            ProfileMiniature(
              Colors.amber,
              "Marti",
              "The UI master",
              "Des",
              'assets/marti.jpeg',
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
            Container(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              child: Text(
                alias,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withAlpha(100),
                ),
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
