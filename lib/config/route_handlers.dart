import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../components/federations/federationslist.dart';
import '../components/leagues/leagueslist.dart';

var routeFederationsHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return new FederationsWidget();
});

var routeLeaguesHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {

      var federationId = params['federationId'];
  return new LeaguesWidget('46', federationId);
});
