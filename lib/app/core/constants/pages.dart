import 'package:artbuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class _Page {
  final Icon icon;
  final String name;
  final Future<void> action;

  _Page({required this.icon, required this.name, required this.action});
}

// ignore: library_private_types_in_public_api
final List<_Page> bottomNavItems = [
  _Page(
    name: 'Home',
    icon: const Icon(Icons.home_rounded),
    action: Routefly.navigate(routePaths.home),
  ),
  _Page(
    name: 'Recommendeds',
    icon: const Icon(Icons.image_search_rounded),
    action: Routefly.navigate(routePaths.recommendeds),
  ),
  _Page(
    name: 'Auctions',
    icon: const Icon(Icons.gavel_rounded),
    action: Routefly.navigate(routePaths.auctions),
  ),
  _Page(
    name: 'Settings',
    action: Routefly.navigate(routePaths.settings),
    icon: const Icon(Icons.settings_rounded),
  ),
];
