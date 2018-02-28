import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class FederationsWidget extends StatefulWidget {
  @override
  State createState() => new FederationsWidgetState();
}

class FederationsWidgetState extends State<FederationsWidget> {
  var _federations = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Szervezetek'),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            new FederationItemWidget(_federations[index]),
        itemCount: _federations.length,
      ),
    );
  }

  _LoadFederations() async {
    var url = 'https://adatbank-backend.herokuapp.com/federations';
    var httpClient = new HttpClient();

    String resultTxt;
    List<dynamic> result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        result = JSON.decode(json);
      } else {
        resultTxt =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      resultTxt = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _federations = _convert(result);
    });
  }

  @override
  void initState() {
    _LoadFederations();
  }

  List<Federation> _convert(List<dynamic> jsonList) {
    List<Federation> retValue = <Federation>[];
    jsonList.forEach((value) => retValue
        .add(new Federation(value['federationId'], value['federationName'])));
    return retValue;
  }
}

class Federation {
  Federation(this.federationId, this.federationName);

  final federationId;
  final federationName;
}

class FederationItemWidget extends StatelessWidget {
  const FederationItemWidget(this.federation);

  final Federation federation;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListTile(
          leading: new Container(
            width: 32.0,
            height: 32.0,
            child: new Image.asset(
                'images/' + this.federation.federationId + '.png'),
          ),
          title: new Text(this.federation.federationName),
          enabled: true,
        ),
        decoration:
            new BoxDecoration(border: new Border(bottom: new BorderSide())));
  }
}
