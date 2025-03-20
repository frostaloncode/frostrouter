import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frostrouter/frostrouter.dart';
import 'package:frostrouter/src/router/frostrouterdelegate.dart';

void main() {
  // Flutter binding'i başlatıyoruz
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FrostRoute Tests', () {
    test('FrostRoute should be created with given parameters', () {
      final frostRoute = FrostRoute(
        name: 'Home',
        path: '/',
        builder: (context) => Text('Home Page'),
      );

      expect(frostRoute.name, 'Home');
      expect(frostRoute.path, '/');
      expect(frostRoute.builder, isA<Widget Function(BuildContext)>());
    });

    test('FrostRoute setters should update values', () {
      final frostRoute = FrostRoute(
        name: 'Home',
        path: '/',
        builder: (context) => Text('Home Page'),
      );

      frostRoute.setName = 'Dashboard';
      frostRoute.setPath = '/dashboard';
      frostRoute.setBuilder = (context) => Text('Dashboard Page');

      expect(frostRoute.name, 'Dashboard');
      expect(frostRoute.path, '/dashboard');
    });
  });

  group('FrostRouter Tests', () {
    late FrostRouter frostRouter;

    setUp(() {
      frostRouter = FrostRouter([
        FrostRoute(
          name: 'Home',
          path: '/',
          builder: (context) => Text('Home Page'),
        ),
        FrostRoute(
          name: 'Dashboard',
          path: '/dashboard',
          builder: (context) => Text('Dashboard Page'),
        ),
      ]);
    });

    test('FrostRouter should store routes correctly', () {
      expect(frostRouter.route.length, 2);
      expect(frostRouter.route.first.name, 'Home');
      expect(frostRouter.route.last.path, '/dashboard');
    });

    test('FrostRouter should update routes when setRouters is called', () {
      final newRoutes = [
        FrostRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context) => Text('Profile Page'),
        )
      ];
      frostRouter.setRouters = newRoutes;

      expect(frostRouter.route.length, 1);
      expect(frostRouter.route.first.name, 'Profile');
    });

    testWidgets('FrostRouter navigation functions should execute without errors', (WidgetTester tester) async {
      expect(() => frostRouter.frostRoutePath('/dashboard'), returnsNormally);
      expect(() => frostRouter.frostRouteReturn(), returnsNormally);
      expect(() => frostRouter.frostRoutePop(), returnsNormally);
      expect(() => frostRouter.frostRouteName('Home'), returnsNormally);
    });
  });

  group('FrostRouterDelegate Tests', () {
    late FrostRouterDelegate delegate;

    setUp(() {
      delegate = FrostRouterDelegate([
        FrostRoute(
          name: 'Home',
          path: '/',
          builder: (context) => Text('Home Page'),
        ),
        FrostRoute(
          name: 'Dashboard',
          path: '/dashboard',
          builder: (context) => Text('Dashboard Page'),
        ),
      ]);
    });

    testWidgets('FrostRouterDelegate should change route path correctly', (WidgetTester tester) async {
      await delegate.setNewRoutePath('/dashboard');
      expect(delegate.currentConfiguration, '/dashboard');

      await delegate.setNewRouteName('Home');
      expect(delegate.currentConfiguration, '/');
    });

    testWidgets('FrostRouterDelegate should revert to old route path', (WidgetTester tester) async {
      await delegate.setNewRoutePath('/dashboard');
      delegate.setOldRoutePath();
      expect(delegate.currentConfiguration, '/');
    });

    testWidgets('FrostRouterDelegate should handle pop correctly', (WidgetTester tester) async {
      delegate.onDidRemovePage();
      expect(delegate.currentConfiguration, '/');
    });
  });
}
