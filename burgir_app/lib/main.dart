import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'homepage.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  get refresh => null;

  @override
  Widget build(BuildContext context) {
    CollectionReference burgers =
        FirebaseFirestore.instance.collection('Burgers');
    //CollectionReference users = FirebaseFirestore.instance.collection('users');
    //dynamic doc;
    return FutureBuilder<QuerySnapshot>(
      future: burgers.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
            appBar: AppBar(title: const Text("Burgir App")),
            body: Stack(alignment: Alignment.topCenter, children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              HomePage(snapshot.data!.docs[0].data())));
                    },
                  ),
                ),
              ),
            ]));
      },
    );
  }
}
