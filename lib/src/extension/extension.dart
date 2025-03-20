import 'package:flutter/material.dart';
import 'package:frostrouter/src/components/extensionroute.dart';
import 'package:frostrouter/src/router/frostrouterdelegate.dart';

extension FrostExtension on BuildContext {
  void frostPath(String path) {
    /// Page access function with Path String value.
    final routers = ExtensionRoute().router;
    final delegate = FrostRouterDelegate(routers);
    delegate.setNewRoutePath(path);
  }

  void frostReturn() {
    /// It lets you go back to the previous page.
    final routers = ExtensionRoute().router;
    final delegate = FrostRouterDelegate(routers);
    delegate.setOldRoutePath();
  }

  void frostPop() {
    /// It lets you move between pages.
    final routers = ExtensionRoute().router;
    final delegate = FrostRouterDelegate(routers);
    delegate.onDidRemovePage();
  }

  void frostName(String name) {
    /// The name tag provides the transition between pages.
    final routers = ExtensionRoute().router;
    final delegate = FrostRouterDelegate(routers);
    delegate.setNewRouteName(name);
  }
}
