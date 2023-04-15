import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

String username = "";
String password = "";

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => RegisterPage();
}

class RegisterPage extends State<Register> {
  List<String> labelStr = ["Email", "Username", "Pasword", "Confirm Password"];
  List<Widget> widgets = [];

  RegisterPage() {
    for (int i = 0; i < labelStr.length; i++) {
      widgets.add(fieldDaftar(labelStr[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xffffffff),
          child: Container(
            margin: EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  "REGISTER",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(231, 69, 206, 206),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: widgets,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Apakah punya akun? ",
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginPage();
                                }));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(231, 69, 206, 206)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(25),
                        elevation: 3,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color.fromARGB(231, 69, 206, 206)),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(231, 69, 206, 206),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));
                              },
                              child: const Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField fieldDaftar(String label) {
    return TextField(
      decoration: InputDecoration(
          labelText: label, labelStyle: TextStyle(color: Color(0xff82916A))),
    );
  }
}
