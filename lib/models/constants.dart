import 'dart:io';
// import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget fondoGradient() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF012F3D),
          Color(0xFF012F3D),
          Color(0xFF0A4F64),
          Color(0xFF0A4F64),
        ],
        stops: [0.1, 0.4, 0.6, 0.9],
      ),
    ),
  );
}

Widget barGradient(String titulo) {
  return AppBar(
    centerTitle: true,
    title: Text(titulo),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xFF4356DE),
            Color(0xFF7602CF),
          ],
          stops: [
            0.1,
            0.6,
          ],
        ),
      ),
    ),
  );
}

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 7.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

Widget cabecera(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 4,
    width: MediaQuery.of(context).size.width,
    // color: Colors.white,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        color: Colors.white),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Operaciones',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'REPORTE DIARIO',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget formDiamCant(
  String titulo,
  TextEditingController txt1,
  TextEditingController txt2,
) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Row(
          children: [
            Container(
              height: 20,
              child: Image.asset("assets/icons/diametro.png"),
            ),
            Flexible(
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: txt1,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Text(
              "Cantidad",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            Flexible(
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: txt2,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    suffix: Text("mt."),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget formDiamCantModificar(
  String titulo,
  String subtitulo1,
  String subtitulo2,
  String txt1,
  String txt2,
  Function func1,
  Function func2,
) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Row(
          children: [
            Text(
              subtitulo1,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            Flexible(
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: txt1,
                  ),
                  onChanged: func1(),
                ),
              ),
            ),
            Text(
              subtitulo2,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            Flexible(
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      hintText: txt2,
                      suffix: Text("mt."),
                    ),
                    onChanged: (txt2) {
                      func2();
                    }),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget itemFormDual(
  String titulo,
  String item1,
  TextEditingController txt1,
  String item2,
  TextEditingController txt2,
) {
  return Padding(
    padding: EdgeInsets.only(left: 30, right: 30, bottom: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              item1,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            Flexible(
              child: Container(
                height: 25,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: txt1,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Text(
              item2,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            Flexible(
              child: Container(
                height: 25,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: txt2,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget itemFormDoble(TextEditingController controller1,
    TextEditingController controller2, String item1, String item2) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
    child: Row(
      children: [
        Text(
          item1,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        Flexible(
          child: Container(
            height: 25,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              // controller: controller1,
              style: TextStyle(fontSize: 15),
              onChanged: (value) {
                controller1.text = value;
              },
            ),
          ),
        ),
        Text(
          item2,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        Flexible(
          child: Container(
            height: 25,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              // controller: controller2,
              onChanged: (value) {
                controller2.text = value;
              },
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  // suffix: Text("mt."),
                  ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget itemSimpleForm(String item1, TextEditingController controller1) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
    child: Row(
      children: [
        Text(
          item1,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        Flexible(
          child: Container(
            height: 25,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: controller1,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    ),
  );
}

Future<bool> internetConnectivity() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}

AppBar appbarGeneral() {
  return AppBar(
    backgroundColor: Color(0xFF012F3D),
    centerTitle: true,
    title: Text(
      "Operaciones",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

CollectionReference _collection =
    FirebaseFirestore.instance.collection('reportes');
