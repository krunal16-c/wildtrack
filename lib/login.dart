/// Name - WildTrack app for tracking wildlife.
/// Solving sustainable goals number 11 and 15
/// Author - Krunal Chavda
/// Please credit the work if you are using it.


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'screen.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("WildTrack"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(20),
            // left: 20, right: 20, top: size.height * 0.2, bottom: size.height * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Image.asset("assets/logo.png", height: 300, width: 200),
            ),
            const Text("Welcome to WildTrack \nSign In Successful",
                style: TextStyle(
                    fontSize: 30
                )),
            Padding(
              padding: const EdgeInsets.all(150.0),
              child: MaterialButton(
                height: 30.0,
                minWidth: 100.0,
                elevation: 30.0,
                // hoverElevation: 20.0,
                padding: const EdgeInsets.all(20.0),
                color: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                // width: 20,
                child:
                  const Text(
                    'Go to WildTrack',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Screen()),
                  );

                },
              ),
            ),
          //   GestureDetector(
          //       onTap: () {
          //         AuthService().signInWithGoogle();
          //       },
          //       child: const Image(width: 200, image: AssetImage('assets/google.png'))),
           ],
        ),
      ),
    );
  }
}
