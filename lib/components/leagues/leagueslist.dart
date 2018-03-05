import 'package:flutter/material.dart';
import '../../helpers/request_handler.dart';

class LeaguesWidget extends StatefulWidget {

  LeaguesWidget(this.seasonId, this.federationId) {

  }

  final seasonId;
  final federationId;

  @override
  State createState() => new LeaguesWidgetState(this.seasonId, this.federationId);
}

class LeaguesWidgetState extends State<LeaguesWidget> {
  var _leagues = [];

  LeaguesWidgetState(this.seasonId, this.federationId) {

  }

  final seasonId;
  final federationId;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Bajnoksagok'),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            new LeagueItemWidget(_leagues[index]),
        itemCount: _leagues.length,
      ),
    );
  }

  _LoadLeagues() async {
    List<dynamic> result = await RequestHandler.LoadLeagues(seasonId, federationId);

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _leagues = _convert(result);
    });
  }

  @override
  void initState() {
    _LoadLeagues();
  }

  List<League> _convert(List<dynamic> jsonList) {
    List<League> retValue = <League>[];
    jsonList.forEach((value) => retValue
        .add(new League(value['leagueId'], value['leagueName'])));
    return retValue;
  }
}

class League {
  League(this.leagueId, this.leagueName);

  final leagueId;
  final leagueName;
}

class LeagueItemWidget extends StatelessWidget {
  const LeagueItemWidget(this.league);

  final League league;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListTile(
          title: new Text(this.league.leagueName),
          enabled: true,
          onTap: () => {

          },
        ),
        decoration:
            new BoxDecoration(border: new Border(bottom: new BorderSide())));
  }
}
