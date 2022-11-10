/// Name - WildTrack app for tracking wildlife.
/// Solving sustainable goals number 11 and 15
/// Author - Krunal Chavda
/// Please credit the work if you are using it.


import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';
import 'storage_service.dart';
import 'auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Screen();
  }
}

class _Screen extends State<Screen> {
  // get margin => null;
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the website $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage =
        Storage(); // importing storage file method from storage_service
    // ignore: dead_code
    String url1 = "assets/krunal.jpg";
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WildTrack'),
          backgroundColor: CupertinoColors.systemGreen,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Image.asset("assets/logo.png", height: 400, width: 300),
              ),

              // padding: const EdgeInsets.all(5.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final results = await FilePicker.platform.pickFiles(
                        allowMultiple: false, // picking one file at a time
                        type: FileType.custom, // custom type for the file
                        allowedExtensions: [
                          'png',
                          'jpg',
                        ], // only jpg and png can be uploaded
                      );
                      if (results == null) {
                        // error checking for null file
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No file has been selected'),
                          ),
                        );
                        return null;
                      }
                      final path = results.files.single.path; // for filepath
                      final name = results.files.single.name; // for filename

                      storage
                          .uploadFile(path!, name)
                          .then((value) => print('Done'));

                      print(path);
                      print(name);
                      // display file uploaded message on screen once the file is uploaded
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('File Uploaded'),
                        ),
                      );
                    },
                    child: const Text('     Upload Image     '),
                    style: ElevatedButton.styleFrom(
                        primary: CupertinoColors.systemGreen,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontStyle: FontStyle.normal)),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      const url = "http://animalprotectionservices.ca/contact/";

                      launchURL(url);
                    },
                    child: const Text('Emergency Service'),
                    style: ElevatedButton.styleFrom(
                        primary: CupertinoColors.systemGreen,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontStyle: FontStyle.normal)),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      const url = "https://mol.org/regions/";

                      launchURL(url);
                    },
                    child: const Text('Wildlife around me'),
                    style: ElevatedButton.styleFrom(
                        primary: CupertinoColors.systemGreen,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontStyle: FontStyle.normal)),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("Krunal Chavda"),
                accountEmail: new Text("krunalchavda1353@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage(url1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
