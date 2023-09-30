import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListPage extends StatelessWidget {
  Color bgColor;
  ListPage({Key? key, required this.bgColor}) : super(key: key);

  CollectionReference candidatoReference =
      FirebaseFirestore.instance.collection("candidato");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LISTA"),
      ),
      body: FutureBuilder(
        future: candidatoReference.get(),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot candidatoCollection = snapshot.data;
            List<QueryDocumentSnapshot> docs = candidatoCollection.docs;
            print(docs.length);
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (BuildContext context, int index) {
                // print(docs[index].data());
                Map<String, dynamic> myDoc =
                    docs[index].data() as Map<String, dynamic>;
                myDoc["id"] = docs[index].id;
                // print(myDoc);
                return ListTile(
                  title: Text(
                    myDoc["nombre"],
                  ),
                  // subtitle: Text(docs[index].id),
                  // subtitle: Text(myDoc["id"]),ubs
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
