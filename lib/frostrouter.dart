import 'package:flutter/material.dart';
import 'package:frostrouter/src/components/extensionroute.dart';
import 'package:frostrouter/src/router/frostrouterconfig.dart';
import 'package:frostrouter/src/router/frostrouterdelegate.dart';

class FrostRoute {
  /// Version 0.9.1

  /// Page Info Class
  FrostRoute({
    required String name,
    required String path,
    required Widget Function(BuildContext context) builder,
  }) : _name = name,
       _path = path,
       _build = builder;

  ///Variables
  /// _name String Page Name
  /// _path String Page Path
  /// _build Function Page Builder
  String _name;
  String _path;
  Widget Function(BuildContext context) _build;

  /// Get Functions
  String get name => _name;
  String get path => _path;
  Widget Function(BuildContext context) get builder => _build;

  /// Set Functions
  set setName(String newName) => _name = newName;
  set setPath(String newPath) => _path = newPath;
  set setBuilder(Widget Function(BuildContext context) newBuilder) =>
      _build = newBuilder;
}

class FrostRouter {
  /// This class lets you access the contents of a package.
  /// You can use this class to access all the settings and functions you need (except for those related to extensions).
  FrostRouter(List<FrostRoute> routers) : _routers = routers {
    _starter();
  }

  /// Variables
  /// _config : Creates the necessary content for RouterConfig and is used.
  /// _route : a list of page information.
  late RouterConfig<Object> _config;
  late List<FrostRoute> _routers;
  FrostRouterDelegate _delegate = FrostRouterDelegate([]);

  /// Get Functions
  RouterConfig<Object> get config => _config;
  List<FrostRoute> get route => _routers;
  FrostRouterDelegate get delegate => _delegate;

  /// Set Functions
  set setConfig(RouterConfig<Object> newconfig) => _config = newconfig;
  set setRouters(List<FrostRoute> newRoutes) => _routers = newRoutes;
  set setDelegate(FrostRouterDelegate newdelegate) => _delegate = newdelegate;

  /// Functions
  void _starter() {
    /// _starter : This is the function that runs first and sets the variables by assigning them content.
    final extensionroute = ExtensionRoute();
    extensionroute.setRouter = _routers;
    _delegate = FrostRouterDelegate(_routers);
    _config = FrostRouterConfig.create(_delegate);
  }

  void frostRoutePath(String path) {
    /// Page access function with Path String value.
    _delegate.setNewRoutePath(path);
  }

  void frostRouteReturn() {
    /// It lets you go back to the previous page.
    _delegate.setOldRoutePath();
  }

  void frostRoutePop() {
    ///It takes you back to the "/" (Home) page from the current page.
    ///If there is a page to return to, it goes back to that page.
    _delegate.onDidRemovePage();
  }

  void frostRouteName(String name) {
    /// The name tag provides the transition between pages.
    _delegate.setNewRouteName(name);
  }
}
