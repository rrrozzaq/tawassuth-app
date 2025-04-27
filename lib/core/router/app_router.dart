import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoutes.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    // add new routes here
  ];
}
