import 'dart:io';
import 'package:android/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pictures.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  final _formKey2 = new GlobalKey<FormState>();
  var txt = TextEditingController();
  bool _initialized = false;
  bool _error = false;
  String name;
  String category;
  num price;
  String description;
  String imgUrl;
  int sellerId;

  String brandName;
  String _errorMessage;

  void initState() {
    super.initState();
  }

  Widget _showForm() {
    return new Container(
      padding: EdgeInsets.all(20.0),
      child: new Form(
        key: _formKey2,
        child: new ListView(shrinkWrap: false, children: <Widget>[
          Center(
            child: imgLink == null
                ? Text('No image selected.')
                : Image.network(imgLink),
          ),
          Container(height: 50, width: 70, child: write_name()),
          Container(height: 50, width: 20, child: write_category()),
          Container(height: 50, width: 20, child: write_price()),
          show_insert_button(),
          showPrimaryButton()
        ]),
      ),
    );
  }

  Widget write_name() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: true,
        decoration: new InputDecoration(
          labelText: "Item Name",
          icon: new Icon(
            Icons.scatter_plot,
            color: Colors.blueGrey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'It can\'t be empty' : null,
        onSaved: (value) => name = value.trim(),
      ),
    );
  }

  Widget write_category() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: true,
        //VOGLIO TESTARE SENZA
        decoration: new InputDecoration(
          labelText: 'Insert category',
          icon: new Icon(
            Icons.space_bar,
            color: Colors.blueGrey,
          ),
        ),
        onChanged: (text) => txt.text = text,
        validator: (value) => value.isEmpty ? 'It can\'t be empty' : null,
        onSaved: (value) => category = value.trim(),
      ),
    );
  }

  Widget write_price() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: new TextFormField(
        maxLines: 1,

        //KEYBOARD TYPE
        keyboardType: TextInputType.number,
        autofocus: true,
        decoration: new InputDecoration(
          labelText: 'Price in Eur',
          icon: new Icon(
            Icons.monetization_on,
            color: Colors.blueGrey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'It can\'t be empty' : null,
        onSaved: (value) => price = value as num,
      ),
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
      child: SizedBox(
        height: 40,
        child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0)),
            color: Colors.blue,
            child: new Text('INSERISCI',
                style: new TextStyle(fontSize: 20, color: Colors.white70)),
            onPressed: validateAndSubmit),
      ),
    );
  }

  Widget show_insert_button() {
    return new Padding(
        padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
        child: SizedBox(
          height: 40,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0)),
            color: Colors.blue,
            child: Row(children: [
              Icon(Icons.add_a_photo),
              new Text('ADD PICTURE',
                  style: new TextStyle(fontSize: 20, color: Colors.white70))
            ]),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => imagePick())),
          ),
        ));
  }

  void validateAndSubmit() async {
    final form = _formKey2.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _errorMessage = "";
      });
    }
  }

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error);
          return Text("error");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("ASTA TARTUFO"),
              centerTitle: true,
              backgroundColor: Colors.black87,
            ),
            body: Stack(
              children: <Widget>[
                _showForm()
                //  Align(alignment: Alignment.topLeft, child: showLogo()),
              ],
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text("waiting...");
      },
    );
  }
}
