import 'package:frostrouter/frostrouter.dart';

class ExtensionRoute {
  /// The ExtensionRouter class is an intermediate class that maintains the route list required for Extension.

  /// Variables
  List<FrostRoute> _router = [];

  /// Get Functions
  List<FrostRoute> get router => _router;

  /// Set Functions
  set setRouter(List<FrostRoute> newRouter) => _router = newRouter;
}
