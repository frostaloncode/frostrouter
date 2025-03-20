
import 'package:flutter/material.dart';
import 'package:frostrouter/src/components/extensionroute.dart';
import 'package:frostrouter/src/router/frostrouterconfig.dart';
import 'package:frostrouter/src/router/frostrouterdelegate.dart';

class FrostRoute
{

  FrostRoute
  (
    {
      required String name,
      required String path,
      required Widget Function(BuildContext context) builder
    }
  ): _name=name, _path=path, _build=builder;

  String _name;
  String _path;
  Widget Function(BuildContext context) _build;

  String get name=> _name;
  String get path=> _path;
  Widget Function(BuildContext context) get builder=> _build;

  set setName(String newName)=> _name=newName;
  set setPath(String newPath)=> _path=newPath;
  set setBuilder(Widget Function(BuildContext context) newBuilder)=> _build=newBuilder;
}

class FrostRouter 
{

  late RouterConfig<Object> _config;
  late List<FrostRoute> _routers;

  FrostRouter(List<FrostRoute> routers)
    : _routers=routers {
      _starter();
    }

  void _starter(){
    final extensionroute= ExtensionRoute();
    extensionroute.setRouter=_routers;
  }


  RouterConfig<Object> get config=> FrostRouterConfig.create(_routers);
  List<FrostRoute> get route=> _routers;

  set setConfig(RouterConfig<Object> newconfig)=> _config=newconfig;
  set setRouters(List<FrostRoute> newRoutes)=> _routers=newRoutes;

  void frostRoutePath(String path){
    final delegate=FrostRouterDelegate(_routers);
    delegate.setNewRoutePath(path);
  }

  void frostRouteReturn(){
    final delegate=FrostRouterDelegate(_routers);
    delegate.setOldRoutePath();
  }

  void frostRoutePop(){
    final delegate=FrostRouterDelegate(_routers);
    delegate.onDidRemovePage();
  }

  void frostRouteName(String name){
    final delegate=FrostRouterDelegate(_routers);
    delegate.setNewRouteName(name);
  }
}
