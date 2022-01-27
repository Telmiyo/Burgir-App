import 'wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'aboutus.dart';
import 'catalogue.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BURGIRS APP',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Navigation(),
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  CollectionReference burgers =
      FirebaseFirestore.instance.collection('Burgers');
  int _selectedIndex = 0;
  late List<Widget> widgetOptions;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: burgers.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: LogoAnimation());
        }
        if (snapshot.hasData) {
          widgetOptions = [
            Catalogue(snapshot.data!.docs[1]),
            WishList(snapshot.data!.docs[0]),
            const AboutUs()
          ];
        }
        return Scaffold(
          body: IndexedStack(
            children: [
              Center(
                child: widgetOptions.elementAt(_selectedIndex),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.grey), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite, color: Colors.grey),
                  label: 'Wishlist'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.grey),
                  label: 'Account'),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTap,
          ),
        );
      },
    );
  }
}

//Logo Animation
class LogoAnimation extends StatefulWidget {
  const LogoAnimation({Key? key}) : super(key: key);

  @override
  _AnimatedRotatingGalaxyDemoState createState() =>
      _AnimatedRotatingGalaxyDemoState();
}

class _AnimatedRotatingGalaxyDemoState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    controller.repeat();
    _rotation = controller;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RotationTransition(
            turns: _rotation,
            child: Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(10),
              color: Colors.transparent,
              child: const Center(
                  child: Image(
                image: AssetImage('assets/logo.png'),
              )),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
