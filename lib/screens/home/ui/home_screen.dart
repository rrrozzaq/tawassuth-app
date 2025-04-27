import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/service_locator.dart';
import '../cubit/prayer_time_cubit.dart';
import 'widgets/floating_middle_card.dart';
import 'widgets/menu_container.dart';
import 'widgets/prayer_time_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<PrayerTimeCubit>(),
        child: const SingleChildScrollView(
          child: Stack(
            children: [
              PrayerTimeWidget(),
              MenuContainer(),
              FloatingMiddleCard(),
            ],
          ),
        ),
      ),
    );
  }
}
