import 'package:fluro/fluro.dart';
import 'route_handlers.dart';

class Routes {

  static String federations = "/";
  static String leagues = "/leagues/:seasonId/:federationId";
  static String results = "results/:seasonId/:federationId/:leagueId/:roundId";

  static void configureRoutes(Router router) {
    router.define(federations, handler: routeFederationsHandler);
    router.define(leagues, handler: routeLeaguesHandler);
  }

}