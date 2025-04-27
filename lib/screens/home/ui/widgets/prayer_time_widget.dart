import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:tawassuth/core/user_state/user_data_cubit.dart';
import 'package:tawassuth/utils/permission_app.dart';

import '../../../../core/components/asset_image.dart';
import '../../../../generated/assets.gen.dart';
import '../../../../utils/function_helper.dart';
import '../../../../utils/get_icon_bytime.dart';
import '../../../../utils/ui_helper.dart';
import '../../cubit/prayer_time_cubit.dart';

class PrayerTimeWidget extends StatefulWidget {
  const PrayerTimeWidget({super.key});

  @override
  State<PrayerTimeWidget> createState() => _PrayerTimeWidgetState();
}

class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {
  final _todayDate = HijriCalendar.now();
  String _userLocation = "loading...";

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    try {
      final location = await getUserLocation();
      if (mounted) {
        final address = await getAddressFromLatLng(
          location.latitude,
          location.longitude,
        );
        if (mounted) {
          setState(() {
            _userLocation = address;
            context.read<UserDataCubit>().setLocation(
              location.latitude,
              location.longitude,
              _userLocation,
            );
          });
        }
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          _userLocation = "Not Found"; // Update jika ada error
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        final prayer = state.currentPrayer;
        final countdown = state.countDown;
        final listPrayer = state.prayerTimes;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: double.maxFinite,
          padding: EdgeInsets.only(top: topPadding(context)),
          color: prayer.background,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: topPadding(context) * 1.6),
                child: TAssetImage(
                  Assets.images.mosqueBackground.path,
                  width: double.maxFinite,
                  height: screenHeight(context) * .3,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${prayer.time.hour}:${prayer.time.minute}",
                                style: Theme.of(
                                  context,
                                ).textTheme.displayMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                spacing: 5,
                                children: [
                                  const Icon(
                                    Icons.access_time_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Text(
                                    "${prayer.name} in ${formatTwoDigits(countdown.inHours)}:${formatTwoDigits(countdown.inMinutes.remainder(60))}:${formatTwoDigits(countdown.inSeconds.remainder(60))}",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _todayDate.toFormat("dd MMMM yyyy"),
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              InkWell(
                                onTap: _initLocation, // Hanya panggil sekali
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: .3),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    spacing: 5,
                                    children: [
                                      const Icon(
                                        Icons.location_on_sharp,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                          _userLocation,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          listPrayer.map((e) {
                            final isCurrent = prayer == e;
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 13,
                              ),
                              constraints: BoxConstraints(
                                minWidth: screenWidth(context) * .16,
                              ),
                              decoration:
                                  isCurrent
                                      ? BoxDecoration(
                                        color: Colors.white.withValues(
                                          alpha: .3,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                      : null,
                              child: Column(
                                spacing: 10,
                                children: [
                                  Text(
                                    e.name,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TAssetImage(getImageByTime(e.name)),
                                  Text(
                                    "${formatTwoDigits(e.time.hour)}:${formatTwoDigits(e.time.minute)}",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
