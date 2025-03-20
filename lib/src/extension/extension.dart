

import 'package:flutter/material.dart';
import 'package:frostrouter/src/components/extensionroute.dart';
import 'package:frostrouter/src/router/frostrouterdelegate.dart';


extension FrostExtension on BuildContext
{

  void frostPath(String path){
    final routers = ExtensionRoute().router;
    final delegate=FrostRouterDelegate(routers);
    delegate.setNewRoutePath(path);
  }

  void frostReturn(){
    final routers = ExtensionRoute().router;
    final delegate=FrostRouterDelegate(routers);
    delegate.setOldRoutePath();
  }

  void frostPop(){
    final routers = ExtensionRoute().router;
    final delegate=FrostRouterDelegate(routers);
    delegate.onDidRemovePage();
  }

  void frostName(String name){
    final routers = ExtensionRoute().router;
    final delegate=FrostRouterDelegate(routers);
    delegate.setNewRouteName(name);
  }
  
}