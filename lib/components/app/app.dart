import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../../config/application.dart';
import '../../config/routes.dart';

import '../federations/federationslist.dart';

class CsapaTomApp extends StatefulWidget {

  @override
  CsapaTomState createState() => new CsapaTomState();

}

class CsapaTomState extends State<CsapaTomApp> {

  CsapaTomState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

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

