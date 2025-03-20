
import 'package:flutter/material.dart';
import 'package:frostrouter/src/router/frostrouterdelegate.dart';

class FrostNavigate
{
  void navigate(BuildContext context, String path)
  {
    final delegate = Router.of(context).routerDelegate as FrostRouterDelegate;
    delegate.setNewRoutePath(path);
  }
}