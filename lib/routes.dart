import 'package:routefly/routefly.dart';

import 'app/(private)/auctions/auctions_page.dart' as a2;
import 'app/(private)/home/home_page.dart' as a3;
import 'app/(private)/recommendeds/recommendeds_page.dart' as a0;
import 'app/(private)/settings_page.dart' as a1;
import 'app/(public)/forgot_password/forgot_password_page.dart' as a6;
import 'app/(public)/signin/signin_page.dart' as a4;
import 'app/(public)/signup/signup_page.dart' as a7;
import 'app/(public)/splash_page.dart' as a5;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/recommendeds',
    uri: Uri.parse('/recommendeds'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.RecommendedsPageWidget(),
    ),
  ),
  RouteEntity(
    key: '/settings',
    uri: Uri.parse('/settings'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.SettingsPageWidget(),
    ),
  ),
  RouteEntity(
    key: '/auctions',
    uri: Uri.parse('/auctions'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.AuctionsPageWidget(),
    ),
  ),
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.HomePageWidget(),
    ),
  ),
  RouteEntity(
    key: '/signin',
    uri: Uri.parse('/signin'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a4.SigninPageWidget(),
    ),
  ),
  RouteEntity(
    key: '/splash',
    uri: Uri.parse('/splash'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a5.SplashPageWidget(),
    ),
  ),
  RouteEntity(
    key: '/forgot_password',
    uri: Uri.parse('/forgot_password'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a6.ForgotPasswordPageWidget(),
    ),
  ),
  RouteEntity(
    key: '/signup',
    uri: Uri.parse('/signup'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a7.SignupPageWidget(),
    ),
  ),
];

const routePaths = (
  path: '/',
  recommendeds: '/recommendeds',
  settings: '/settings',
  auctions: '/auctions',
  home: '/home',
  signin: '/signin',
  splash: '/splash',
  forgotPassword: '/forgot_password',
  signup: '/signup',
);
