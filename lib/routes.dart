import 'package:routefly/routefly.dart';

import 'app/(public)/auth/forgot_password_page.dart' as a0;
import 'app/(public)/auth/login_page.dart' as a3;
import 'app/(public)/auth/register_page.dart' as a1;
import 'app/(public)/auth/splash_page.dart' as a2;
import 'app/(public)/dashboard/home_page.dart' as a6;

List<RouteEntity> get routes => [
      RouteEntity(
        key: '/forgot_password',
        uri: Uri.parse('/forgot_password'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a0.RegisterWidget(),
        ),
      ),
      RouteEntity(
        key: '/register',
        uri: Uri.parse('/register'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a1.RegisterWidget(),
        ),
      ),
      RouteEntity(
        key: '/splash',
        uri: Uri.parse('/splash'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a2.SplashPage(),
        ),
      ),
      RouteEntity(
        key: '/login',
        uri: Uri.parse('/login'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a3.LoginWidget(),
        ),
      ),
      RouteEntity(
        key: '/home',
        uri: Uri.parse('/home'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a6.HomeWidget(),
        ),
      ),
    ];

const routePaths = (
  path: '/',
  forgotPassword: '/forgot_password',
  register: '/register',
  splash: '/splash',
  login: '/login',
  home: '/home',
);
