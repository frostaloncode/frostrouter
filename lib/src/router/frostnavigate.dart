import 'package:flutter/material.dart';
import 'package:frostrouter/src/router/frostrouterdelegate.dart';

class FrostNavigate {
  void navigate(BuildContext context, String path) {
    ///  This performs navigation in the application using the specified path.
    /// It also sets a new route using RouterDelegate and updates the application's view according to this new route.
    final delegate = Router.of(context).routerDelegate as FrostRouterDelegate;
    delegate.setNewRoutePath(path);
  }
}
