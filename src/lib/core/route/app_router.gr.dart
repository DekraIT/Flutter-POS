// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:src/pages/homePage/home_page.dart' as _i1;
import 'package:src/pages/placeholderPage/placeholder_page.dart' as _i2;
import 'package:src/pages/secondPage/second_page.dart' as _i3;
import 'package:src/pages/splash_screen_page.dart' as _i4;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.PlaceholderPage]
class PlaceholderRoute extends _i5.PageRouteInfo<void> {
  const PlaceholderRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PlaceholderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceholderRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.PlaceholderPage();
    },
  );
}

/// generated route for
/// [_i3.SecondPage]
class SecondRoute extends _i5.PageRouteInfo<SecondRouteArgs> {
  SecondRoute({
    _i6.Key? key,
    required String title,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SecondRoute.name,
          args: SecondRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'SecondRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SecondRouteArgs>();
      return _i3.SecondPage(
        key: args.key,
        title: args.title,
      );
    },
  );
}

class SecondRouteArgs {
  const SecondRouteArgs({
    this.key,
    required this.title,
  });

  final _i6.Key? key;

  final String title;

  @override
  String toString() {
    return 'SecondRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i4.SplashScreenPage]
class SplashRouteRoute extends _i5.PageRouteInfo<void> {
  const SplashRouteRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRouteRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreenPage();
    },
  );
}
