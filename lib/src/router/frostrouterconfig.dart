import 'package:flutter/material.dart';
import 'package:frostrouter/src/router/frostrouteparser.dart';
import 'package:frostrouter/src/router/frostrouterdelegate.dart';
import 'package:frostrouter/src/router/frostrouterprovider.dart';

class FrostRouterConfig {
  static RouterConfig<Object> create(FrostRouterDelegate delegate) {
    /// This method creates the application's routing configuration.
    /// It provides the necessary analysis and routing logic for routes with FrostRouteParser and FrostRouterDelegate.
    /// In the end, the RouterConfig object gives Flutter the necessary configuration for the routing functionality and allows the application to switch between different pages correctly.
    return RouterConfig(
      routeInformationProvider: FrostRouterProvider(),
      routeInformationParser: FrostRouteParser(),
      routerDelegate: delegate,
    );
  }
}
