
import 'package:flutter/material.dart';
import 'package:frostrouter/frostrouter.dart';

final frostrouter = FrostRouter(
  [
    FrostRoute(
      name: 'homepage', 
      path: '/', 
      builder: (context) => HomePage(),
    ),
    FrostRoute(
      name: 'SecondaryPage', 
      path: '/secondary', 
      builder: (context) => SecondaryPage(),
    ),
    FrostRoute(
      name: 'TertileryPage', 
      path: '/tertilery', 
      builder: (context) => TertileryPage(),
    )
  ]
);

void main(){
  runApp(
    MaterialApp.router(
      routerConfig: frostrouter.config,
    )
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage'),centerTitle: true),
      body: Center(child: Column(children: [
        ElevatedButton(onPressed: (){
          frostrouter.frostRouteName('SecondaryPage');
        }, child: Text('Name Go Second Page')),
        ElevatedButton(onPressed: (){
          frostrouter.frostRoutePath('/secondary');
        }, child: Text('Path Go Second Page')),
      ],),),
    );
  }
}

class SecondaryPage extends StatelessWidget {
  const SecondaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecondaryPage'),centerTitle: true),
      body: Center(child: Column(children: [
        ElevatedButton(onPressed: (){
          frostrouter.frostRouteName('TertileryPage');
        }, child: Text('Name Go TertileryPage')),
        ElevatedButton(onPressed: (){
          frostrouter.frostRoutePath('/tertilery');
        }, child: Text('Path Go TertileryPage')),
        ElevatedButton(onPressed: (){
          frostrouter.frostRoutePop();
        }, child: Text('Pop Home Page')),
        ElevatedButton(onPressed: (){
          frostrouter.frostRouteReturn();
        }, child: Text('Return Home Page')),
      ],),),
    );
  }
}

class TertileryPage extends StatelessWidget {
  const TertileryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TertileryPage'),centerTitle: true),
      body: Center(child: Column(children: [
        ElevatedButton(onPressed: (){
          frostrouter.frostRouteName('homepage');
        }, child: Text('Name Go Home Page')),
        ElevatedButton(onPressed: (){
          frostrouter.frostRoutePath('/');
        }, child: Text('Path Go Home Page')),
        ElevatedButton(onPressed: (){
          frostrouter.frostRoutePop();
        }, child: Text('Pop SecondaryPage')),
        ElevatedButton(onPressed: (){
          frostrouter.frostRouteReturn();
        }, child: Text('Return SecondaryPage')),
      ],),),
    );
  }
}