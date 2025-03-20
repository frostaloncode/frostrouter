
import 'package:frostrouter/frostrouter.dart';

class ExtensionRoute{

  List<FrostRoute> _router=[];

  List<FrostRoute> get router=> _router;
  set setRouter(List<FrostRoute> newRouter)=> _router=newRouter;
}