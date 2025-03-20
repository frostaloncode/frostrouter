
import 'package:flutter/material.dart';

class FrostRouteParser extends RouteInformationParser<String>
{

  @override 
  Future<String> parseRouteInformation(RouteInformation routeInformation) async 
  {
    return routeInformation.uri.toString() ?? '/';
  }

  @override
  RouteInformation? restoreRouteInformation(String configuration)
  {
    return RouteInformation(uri: Uri.parse(configuration));
  }
}