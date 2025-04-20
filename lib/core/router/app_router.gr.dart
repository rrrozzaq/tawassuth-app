// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:tawassuth/screens/home/ui/home_screen.dart' as _i1;
import 'package:tawassuth/screens/scholars/data/scholars_model.dart' as _i6;
import 'package:tawassuth/screens/scholars/ui/scholars_detail_screen.dart'
    as _i2;
import 'package:tawassuth/screens/scholars/ui/scholars_screen.dart' as _i3;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.ScholarsDetailScreen]
class ScholarsDetailRoute extends _i4.PageRouteInfo<ScholarsDetailRouteArgs> {
  ScholarsDetailRoute({
    _i5.Key? key,
    required _i6.ScholarsModel scholarsData,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         ScholarsDetailRoute.name,
         args: ScholarsDetailRouteArgs(key: key, scholarsData: scholarsData),
         initialChildren: children,
       );

  static const String name = 'ScholarsDetailRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ScholarsDetailRouteArgs>();
      return _i2.ScholarsDetailScreen(
        key: args.key,
        scholarsData: args.scholarsData,
      );
    },
  );
}

class ScholarsDetailRouteArgs {
  const ScholarsDetailRouteArgs({this.key, required this.scholarsData});

  final _i5.Key? key;

  final _i6.ScholarsModel scholarsData;

  @override
  String toString() {
    return 'ScholarsDetailRouteArgs{key: $key, scholarsData: $scholarsData}';
  }
}

/// generated route for
/// [_i3.ScholarsScreen]
class ScholarsRoute extends _i4.PageRouteInfo<void> {
  const ScholarsRoute({List<_i4.PageRouteInfo>? children})
    : super(ScholarsRoute.name, initialChildren: children);

  static const String name = 'ScholarsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.ScholarsScreen();
    },
  );
}
