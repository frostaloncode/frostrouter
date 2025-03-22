import 'package:flutter/material.dart';

class FrostRouterProvider extends RouteInformationProvider {
  /// This class extends RouteInformationProvider and wraps around
  /// PlatformRouteInformationProvider to manage route information.

  final RouteInformationProvider _provider;

  FrostRouterProvider({String initialRoute = '/'})
    : _provider = PlatformRouteInformationProvider(
        initialRouteInformation: RouteInformation(uri: Uri.parse(initialRoute)),
      );

  /// Getter to access the configured RouteInformationProvider
  RouteInformationProvider get provider => _provider;

  @override
  RouteInformation get value {
    // Directly return _provider.value without null-aware operation
    return _provider.value;
  }

  @override
  void addListener(VoidCallback listener) {
    _provider.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _provider.removeListener(listener);
  }

  @override
  void routerReportsNewRouteInformation(
    RouteInformation routeInformation, {
    RouteInformationReportingType type = RouteInformationReportingType.none,
  }) {
    _provider.routerReportsNewRouteInformation(routeInformation, type: type);
  }
}
