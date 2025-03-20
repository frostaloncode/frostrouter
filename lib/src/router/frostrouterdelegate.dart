import 'package:flutter/material.dart';
import 'package:frostrouter/frostrouter.dart';


class FrostRouterDelegate extends RouterDelegate<String> with ChangeNotifier , PopNavigatorRouterDelegateMixin<String>
{

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();
  @override
  String get currentConfiguration=> _currentpath;


  FrostRouterDelegate(this._routes);

  final List<FrostRoute> _routes;
  String _currentpath= '/';
  late String _oldpath='/';

  @override
  Future<void> setNewRoutePath(String path) async 
  {
    if(_routes.any((route)=> route.path == path ))
    {
      _oldpath=_currentpath;
      _currentpath=path;
      notifyListeners();
    }
  }

  void setOldRoutePath() async {
    if(_oldpath.isNotEmpty)
    {
      await setNewRoutePath(_oldpath);
    }
    else
    {
      await setNewRoutePath('/');
    }
    
  }

  Future<void> setNewRouteName(String name) async 
  {
    final route = _routes.firstWhere(
      (route) => route.name == name,
      orElse: () => _routes.first,
    );
    _oldpath=_currentpath;
    _currentpath = route.path;
    notifyListeners();
  }


  void onDidRemovePage() {
    if (navigatorKey!.currentState?.canPop() ?? false) {
      navigatorKey!.currentState?.pop(); 
    } else {
      _currentpath = "/";
      notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context)
  {
    final currentroute= _routes.firstWhere
    (
      (route) => route.path == _currentpath,
      orElse: () => _routes.first,
    );

    return Navigator
    (
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey(_currentpath),
          child: currentroute.builder(context)
        )
      ],
      onDidRemovePage: (page) => onDidRemovePage(),
    );
  }
}