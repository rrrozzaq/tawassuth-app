import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/user_state/user_data_cubit.dart';
import 'generated/fonts.gen.dart';
import 'core/router/app_router.dart';
import 'core/service_locator.dart';
import 'utils/color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        // add global cubit here
        BlocProvider(create: (context) => getIt<UserDataCubit>()),
      ],
      child: MyApp(),
    ),
  );
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
        fontFamily: FontFamily.poppins,
        colorSchemeSeed: TColors.mainColor,
        useMaterial3: true,
      ),
    );
  }
}
