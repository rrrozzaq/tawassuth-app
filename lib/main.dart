import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
import 'core/service_locator.dart';
import 'utils/color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Tawassuth',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorSchemeSeed: TColors.mainColor,
        useMaterial3: true,
      ),
    );
  }
}
