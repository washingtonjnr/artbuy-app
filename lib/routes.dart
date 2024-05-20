import 'package:routefly/routefly.dart';

import 'app/(public)/auth/forgot_password_page.dart' as a4;
import 'app/(public)/auth/signin_page.dart' as a3;
import 'app/(public)/auth/signup_page.dart' as a6;
import 'app/(public)/auth/splash_page.dart' as a5;
import 'app/(public)/dashboard/home_page.dart' as a2;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/dashboard/home',
    uri: Uri.parse('/dashboard/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.HomePageWidget(),
    ),
  ),
  RouteEntity(
    key: '/auth/signin',
    uri: Uri.parse('/auth/signin'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.SigninPageWidget(),
    ),
  ),
  RouteEntity(
    key: '/auth/forgot_password',
    uri: Uri.parse('/auth/forgot_password'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a4.RegisterPageWidget(),
    ),
  ),
  RouteEntity(
    key: '/auth/splash',
    uri: Uri.parse('/auth/splash'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a5.SplashPageWidget(),
    ),
  ),
  RouteEntity(
    key: '/auth/signup',
    uri: Uri.parse('/auth/signup'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a6.SignupPageWidget(),
    ),
  ),
];

const routePaths = (
  path: '/',
  dashboard: (
    path: '/dashboard',
    home: '/dashboard/home',
  ),
  auth: (
    path: '/auth',
    signin: '/auth/signin',
    forgotPassword: '/auth/forgot_password',
    splash: '/auth/splash',
    signup: '/auth/signup',
  ),
);
