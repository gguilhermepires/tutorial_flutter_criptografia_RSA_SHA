import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHA',
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {


  final myController = TextEditingController();
  String _stringEncoded = '';

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tutorial SHA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: "Escreva alguam coisa para ser criptografado",
                ),
              ),
            ),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.orangeAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text("Texto criptografado"),
                      Divider(),
                      Text(_stringEncoded),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child:
                      _stringEncoded.isEmpty ? Text("SHA256") : Text("SHA256"),
                  color: Colors.yellow,
                  onPressed: () async {
                    String tmp = "";
                    try {
                      final text = myController.text;
                      if (text.isNotEmpty) {
                        var bytes =
                            utf8.encode(myController.text); // data being hashed
                        var digest = sha256.convert(bytes);
                        setState(() {
                          _stringEncoded = digest.toString();
                          print(tmp);
                          myController.clear();
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                RaisedButton(
                  child: Text("Limpar"),
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      _stringEncoded = "";
                      myController.clear();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
