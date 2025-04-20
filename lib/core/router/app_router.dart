import 'package:auto_route/auto_route.dart';
import 'package:tawassuth/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: ScholarsRoute.page),
    AutoRoute(page: ScholarsDetailRoute.page),
    // add new routes here
  ];
}
