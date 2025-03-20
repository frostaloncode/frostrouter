

import 'package:flutter/material.dart';
import 'package:frostrouter/frostrouter.dart';
import 'package:frostrouter/src/router/frostrouteparser.dart';
import 'package:frostrouter/src/router/frostrouterdelegate.dart';

class FrostRouterConfig
{
  static RouterConfig<Object> create(List<FrostRoute> routes) 
  {
    return RouterConfig(
      routeInformationParser: FrostRouteParser(),
      routerDelegate: FrostRouterDelegate(routes),
    );
  }
}