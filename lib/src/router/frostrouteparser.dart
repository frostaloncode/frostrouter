import 'package:flutter/material.dart';

class FrostRouteParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    /// This method checks the incoming redirect information:
    /// If the URI is empty, it redirects to the application's home page ('/').
    /// If the URI is not empty, it returns the specified URI path.
    /// This is especially important for the application to load the correct page based on the URL.
    if (routeInformation.uri.toString().isEmpty ||
        routeInformation.uri.toString() == '') {
      return '/';
    }
    return routeInformation.uri.toString();
  }

  @override
  RouteInformation? restoreRouteInformation(String configuration) {
    ///  It takes the given configuration string (i.e., the route path) and turns it into a Uri object.
    /// Then, it makes a RouteInformation object with this URI and gives it back to you.
    /// This is really helpful during routing, especially when the user needs to go back to a specific route or when it's necessary to reload a route that was used before.
    return RouteInformation(uri: Uri.parse(configuration));
  }
}
