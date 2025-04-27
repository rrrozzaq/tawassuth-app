// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:tawassuth/screens/authentication/ui/login_screen.dart' as _i2;
import 'package:tawassuth/screens/home/ui/home_screen.dart' as _i1;
import 'package:tawassuth/screens/qiblat/ui/qiblat_finder_screen.dart' as _i3;

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
/// [_i2.LoginScreens]
class LoginRoutes extends _i4.PageRouteInfo<void> {
  const LoginRoutes({List<_i4.PageRouteInfo>? children})
    : super(LoginRoutes.name, initialChildren: children);

  static const String name = 'LoginRoutes';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginScreens();
    },
  );
}

/// generated route for
/// [_i3.QiblatFinderScreen]
class QiblatFinderRoute extends _i4.PageRouteInfo<void> {
  const QiblatFinderRoute({List<_i4.PageRouteInfo>? children})
    : super(QiblatFinderRoute.name, initialChildren: children);

  static const String name = 'QiblatFinderRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.QiblatFinderScreen();
    },
  );
}
