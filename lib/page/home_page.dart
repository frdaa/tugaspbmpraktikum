import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bbController = TextEditingController();
  var tbController = TextEditingController();
  double? rresult;
  String? status;

  void calculatorBMI() {
    double tinggi = double.parse(tbController.text) / 100;
    double berat = double.parse(bbController.text);

    double totaltinggi = tinggi * tinggi;
    double result = berat / totaltinggi;
    rresult = result;

    setState(() {
      if (rresult! < 18) {
        status = 'maaf kamu kurus';
      } else if (rresult! < 26) {
        status = "waww kamu normal";
      } else {
        status = "maaf kamu gendut";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Calculate ur BMI')),
          backgroundColor: Color.fromARGB(231, 69, 206, 206),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/pict.png')),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: bbController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Weight (kg)",
                      hintText: "Enter Your Weight"),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: tbController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Height (cm)",
                      hintText: "Enter Your Height"),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: 150,
                // color: Colors.black,
                decoration: BoxDecoration(
                    color: Color.fromARGB(231, 69, 206, 206),
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: calculatorBMI,
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                rresult == null ? "Result" : "${rresult}",
                style: new TextStyle(),
              ),
              Text(
                "Category : $status",
                style: new TextStyle(),
              )
            ]));
  }
}
