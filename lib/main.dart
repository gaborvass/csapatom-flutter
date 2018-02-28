import 'package:flutter/material.dart';
import 'federationslist.dart';

void main() => runApp(new CsapaTomApp());

class CsapaTomApp extends StatefulWidget {

  @override
  CsapaTomState createState() => new CsapaTomState();

}

class CsapaTomState extends State<CsapaTomApp> {

  ThemeData get theme {
    return new ThemeData(
        dividerColor: Colors.black,
        scaffoldBackgroundColor: Colors.green,
        backgroundColor: Colors.yellow
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CsapaTom',
      theme: theme,
      routes: <String, WidgetBuilder> {
        '/': (BuildContext buildContext) => new FederationsWidget()
      }
    );
  }

}

