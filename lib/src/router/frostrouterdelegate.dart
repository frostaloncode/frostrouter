import 'package:flutter/material.dart';
import 'package:frostrouter/frostrouter.dart';

class FrostRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  @override
  GlobalKey<NavigatorState>? get navigatorKey =>
      /// Each time it is called, it returns a new GlobalKey<NavigatorState> object.
      /// This key is used to control and manage navigation and routing operations.
      /// It is used to access and change the state of a specific Navigator within the application.
      GlobalKey<NavigatorState>();

  @override
  String get currentConfiguration =>
      /// This "getter" is a special kind of function that returns the value of the _currentPath variable inside the class.
      /// This lets you use the value elsewhere in your code.
      /// Getters like this are typically used to get the current routing path or to monitor the current state of the application.
      _currentpath;

  /// It makes an instance of the FrostRouterDelegate class and passes it the list of routes that provides the application's routing information.
  /// This delegate manages the application's routing operations and loads the correct page or performs page transitions according to a given route path.
  FrostRouterDelegate(this._routes);

  /// Variables
  final List<FrostRoute> _routes;
  String _currentpath = '/';
  late String _oldpath = '/';

  @override
  Future<void> setNewRoutePath(String path) async {
    /// This checks to see if the path parameter is included in the list of available routes.
    /// If it is a valid route, the current route information (_currentpath) is transferred to _oldpath.
    /// The new route information (path) is assigned to _currentpath. Finally, by calling notifyListeners(), these changes are sent to the listeners and the UI can be updated.
    /// This allows the navigation structure of the application to be updated dynamically and the user to be redirected to a new page.
    if (_routes.any((route) => route.path == path)) {
      _oldpath = _currentpath;
      _currentpath = path;
      notifyListeners();
    }
  }

  void setOldRoutePath() async {
    /// The setOldRoutePath method uses the old route if there is a valid route in the _oldpath variable.
    /// If there is no old route information, it will redirect to the '/' (home) route.
    /// In short, this method returns to the previous route or redirects to the start page.
    if (_oldpath.isNotEmpty) {
      await setNewRoutePath(_oldpath);
    } else {
      await setNewRoutePath('/');
    }
  }

  Future<void> setNewRouteName(String name) async {
    /// It finds a route with the same name and switches to that route.
    /// If it can't find a match, it switches to the first route on the list (_routes.first).
    /// During this process, the old route information (_oldpath) is stored and the current route (_currentpath) is updated.
    /// The UI is refreshed by notifying the change with notifyListeners(). This method allows you to switch over the route name.
    final route = _routes.firstWhere(
      (route) => route.name == name,
      orElse: () => _routes.first,
    );
    _oldpath = _currentpath;
    _currentpath = route.path;
    notifyListeners();
  }

  void onDidRemovePage() {
    /// The onDidRemovePage method removes the current page if it can be removed and returns to the previous page.
    /// If the current page can't be removed, the "_currentPath" property is set to the home page ("/") and the user interface is updated.
    /// This method is typically used to navigate back through the navigation stack and redirects to the home page if the stack is empty.
    if (navigatorKey!.currentState?.canPop() ?? false) {
      navigatorKey!.currentState?.pop();
    } else {
      /// Eğer stack boşsa, ana sayfaya gider.
      _currentpath = "/";
      notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Finds the route that matches _currentpath and displays the corresponding page (currentroute.builder(context)) in the Navigator widget.
    /// If no matching route is found, the first route in the list is displayed.
    /// Also, if the page is removed, the onDidRemovePage method is called and the necessary actions are taken.
    /// This structure provides dynamic route management and manages the transition between pages.
    final currentroute = _routes.firstWhere(
      (route) => route.path == _currentpath,
      orElse: () => _routes.first,
    );

    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey(_currentpath),
          child: currentroute.builder(context),
        ),
      ],
      onDidRemovePage: (page) => onDidRemovePage(),
    );
  }
}
