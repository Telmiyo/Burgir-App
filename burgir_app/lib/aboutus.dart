import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  final dynamic doc;
  const AboutUs(this.doc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              doc["AboutUs"],
              style: const TextStyle(fontSize: 25),
            ),
          ),
          Row(
            children: const [
              ArrowButton(Icons.arrow_left),
              ProfileImage(),
              ArrowButton(Icons.arrow_right)
            ],
          ),
          const Description(),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withAlpha(80),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: const Text(
          "This is the description of...",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
        width: 400,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.grey.withAlpha(80),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(25),
          width: 400,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(80),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const AnimatedImage(),
        ),
      ),
    );
  }
}

class ArrowButton extends StatelessWidget {
  final IconData icon;
  const ArrowButton(
    this.icon, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Icon(
        icon,
        color: Colors.grey,
        size: 50,
      ),
    );
  }
}

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key}) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> {
  late double width, height;
  //late Color color;
  //late double radius;

  void setMaxValues() {
    width = 400;
    height = 400;
  }

  setMinValues() {
    width = 380;
    height = 40;
  }

  @override
  void initState() {
    super.initState();
    setMinValues();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          height: 400,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.ease,
              width: width,
              height: height,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() => setMaxValues());
          },
          child: const Text("New rectangle"),
        ),
      ],
    );
  }
}
