import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection('candidato');

//5
  // StreamController myStreamController = StreamController();
  StreamController<int> myStreamController = StreamController();

  Stream<int> counter() async* {
    for (int i = 0; i < 10; i++) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<int> getNumber() async {
    return 10;
  }

  //4
  Future<int> getNumberStream() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return 100;
    });
  }

//primero solo future y despues stream, escuchamos lo que emite el stream, escucha activa
  @override
  Widget build(BuildContext context) {
    //4
    print("init stream");
    Stream<int> myStream = Stream.fromFuture(getNumberStream());
    print("stream creado");
    // myStream.listen((value) {
    counter().listen((value) {
      print("valor del stream");
      print(value);
    }, onDone: () {
      print("FINNNNNNN!!!");
    }, onError: (Error) {
      print("errrrroe");
    });

    //1
    getNumber().then((value) {
      print(value);
    });

    // counter().listen((value) {
    //   print(value);
    // });
    return Scaffold(
      appBar: AppBar(title: Text("STREAM PAGE")),
      //111111111111111111111111
      // body: FutureBuilder(
      //   future: getNumber(),
      //   builder: (BuildContext context, AsyncSnapshot snap) {
      //     if (snap.hasData) {
      //       return Text(snap.data.toString());
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),

//222222
      //CURIOSO QUE ES UN STATELESS Y EL ESTADO CAMBIA
      // body: StreamBuilder(
      //   stream: counter(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
      //       return Center(
      //         child: Text(snapshot.data.toString()),
      //       );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),

//3
//agregar elemento en firestore y se actualiza automatiamente el print
//si actualizar cualquier cambio de igual forma se vuelve a printear
      // body: StreamBuilder(
      //   stream:
      //       candidateReference.snapshots(), //tipo querysnapshot es un stream
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
      //       //base de dato en tiempo real
      //       //web socket, una caracteristica que le das al backend,
      //       //tuberia que permite transmitir datos de forma continnua
      //       //como cunfionan los chats (escribiendo)
      //       QuerySnapshot candidatesCollection = snapshot.data;
      //       return ListView.builder(
      //         itemCount: candidatesCollection.size,
      //         itemBuilder: (BuildContext context, int index) {
      //           Map<String, dynamic> myDoc = candidatesCollection.docs[index]
      //               .data() as Map<String, dynamic>;
      //           //segundo
      //           myDoc["id"] = candidatesCollection.docs[index].id;
      //           print(myDoc["nombre"]);
      //           // return Text(myDoc["nombre"]);
      //           return ListTile(
      //             title: Text(myDoc["nombre"]),
      //             subtitle: Text(myDoc["id"]),
      //           );
      //         },
      //       );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),

      //4
    );
  }
}
