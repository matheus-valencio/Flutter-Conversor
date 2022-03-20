// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Temperatura.',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  String valor1 = 'a';
  double valor2 = 1;
  String valor3 = 'a';
  double valor4 = 1;
  String valor5 = 'a';

  @override
  void initState() {
    super.initState();
    myController.text = '32.00';
    myController2.text = '0';
    // Start listening to changes.
    myController.addListener(_converterC);
    myController2.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    valor3 = '${myController2.text}';
    if (valor3 == '') {
      valor3 = '0';
    }
    valor4 = ((double.tryParse(valor3)! * 1.8) + 32);
    valor5 = valor4.toStringAsFixed(2);
  }

  void _converterC() {
    valor1 = '${myController.text}';
    if (valor1 == '') {
      valor5 = '0';
      valor1 = '0';
    }
    valor2 = ((double.tryParse(valor1)! - 32) / 1.8);
    valor5 = valor2.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Temperatura'),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 30, 42, 49),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: 300,

              // ignore: prefer_const_literals_to_create_immutables
              child: Column(children: [
                const Padding(
                  padding:
                      EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 50),
                  child: Text(
                    'Conversor Cº/Fº',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 40),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 00),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 30, 42, 49),
                    border: Border.all(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                    controller: myController2,
                    onChanged: (text) {
                      myController.text = valor5;
                    },
                    decoration: InputDecoration(
                      labelText: "°C",
                      labelStyle: TextStyle(fontSize: 30, color: Colors.amber),
                      border: InputBorder.none,
                      filled: false,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 00),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 30, 42, 49),
                    border: Border.all(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                    controller: myController,
                    onChanged: (text) {
                      myController2.text = valor5;
                    },
                    decoration: InputDecoration(
                      labelText: "°F",
                      labelStyle: TextStyle(fontSize: 30, color: Colors.amber),
                      border: InputBorder.none,
                      filled: false,
                    ),
                  ),
                ),
              ]),
            ),

            Row()
          ],
        ),
      ),
    );
  }
}
