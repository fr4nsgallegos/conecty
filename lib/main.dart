import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conecty/feed_page.dart';
import 'package:conecty/pages/home_page.dart';
import 'package:conecty/pages/list_page.dart';
import 'package:conecty/pages/login_view.dart';
import 'package:conecty/pages/map_page.dart';
import 'package:conecty/pages/stream_page.dart';
import 'package:conecty/pages/stream_page2.dart';
import 'package:conecty/pages/stream_page3.dart';
import 'package:conecty/pages/tab_bar_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Navigation Basics',
    // home: MyApp(),
    // home: loginView(),
    home: TabBarScreen(),
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  CollectionReference candidatoCollection =
      FirebaseFirestore.instance.collection('candidato');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                candidatoCollection.get().then((value) {
                  QuerySnapshot candidatoCollection = value;
                  // print(candidatoCollection);
                  List<QueryDocumentSnapshot> docs = candidatoCollection.docs;
                  // print(docs);
                  // print(value.docs);
                  // print(value.docs.first.data());
                  docs.forEach((element) {
                    print(element.id);
                    print(element.data());
                  });
                });
              },
              child: Text("Obtener data"),
            ),
            ElevatedButton(
              onPressed: () {
                candidatoCollection.add(
                  {
                    'nombre': 'frans',
                    'votos': 5,
                  },
                ).then(
                  (value) {
                    print(value.id);
                  },
                );
              },
              child: Text("agregar"),
            ),
            ElevatedButton(
              onPressed: () {
                candidatoCollection
                    .doc("CAND1")
                    .set({
                      'nombre': 'jhonnysss',
                      'votos': 5,
                    })
                    .then((value) {})
                    .catchError((error) {});
              },
              child: Text("agregar 2"),
            ),
            ElevatedButton(
              onPressed: () {
                candidatoCollection
                    .doc("tom")
                    .update({"candidato": 'TOMY', 'votos': 250})
                    .then((value) {})
                    .catchError(
                      (error) {
                        print(error);
                      },
                    );
              },
              child: Text("actualizar"),
            ),
            ElevatedButton(
              onPressed: () {
                candidatoCollection
                    .doc("tom")
                    .delete()
                    .then((value) {})
                    .catchError(
                  (error) {
                    print(error);
                  },
                );
              },
              child: Text("eliminar"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListPage(
                              bgColor: Colors.red,
                            )),
                  );
                },
                child: Text("ver lista")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StreamPage3()),
                  );
                },
                child: Text("Stream Pagess")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedPage()),
                  );
                },
                child: Text("otraaApp"))
          ],
        ),
      ),
    );
  }
}
