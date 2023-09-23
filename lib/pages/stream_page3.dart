import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//IMPORTANTE LIBERAR EL RECURSO DEL STREAM PORQUE
//PUEDE CAUSAR FUGA DE MEMORIA ETC ETC
// SE CONVIERTE A UN STATEFUL
class StreamPage3 extends StatefulWidget {
  @override
  State<StreamPage3> createState() => _StreamPage3State();
}

class _StreamPage3State extends State<StreamPage3> {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection('candidato');

//5
  StreamController<int> myStreamController = StreamController.broadcast();

  int myCounter = 0;

  Stream<int> counter() async* {
    for (int i = 0; i < 10; i++) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
    }
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
    myStreamController.stream.listen((value) {
      print("valor del stream");
      print(value);
    }, onDone: () {
      print("FINNNNNNN!!!");
    }, onError: (Error) {
      print("errrrroe");
    });

    return Scaffold(
      appBar: AppBar(title: Text("STREAM PAGE2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SEGUNDO
            Text(
              "0",
              style: TextStyle(fontSize: 40),
            ),

            // TERCERO
            StreamBuilder(
              stream: myStreamController.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 40),
                  );
                }
                return Text(
                  "0",
                  style: TextStyle(fontSize: 40),
                );
              },
            ),

            //PRIMERO ESTO PARA EXPLICAR CONTROLLERSTREAM
            ElevatedButton(
              onPressed: () {
                //tuberia cuando presionamos recien transmitimos la data o agua
                myStreamController.add(myCounter);
                myCounter += 1;
              },
              child: Text("emitir"),
            ),
          ],
        ),
      ),
    );
  }
}
