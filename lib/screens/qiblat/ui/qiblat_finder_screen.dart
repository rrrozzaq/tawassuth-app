import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import '../../../core/components/asset_image.dart';
import '../../../core/components/button/filled_button.dart';
import '../../../generated/assets.gen.dart';
import '../../../utils/permission_app.dart';
import '../../../utils/ui_helper.dart';

@RoutePage()
class QiblatFinderScreen extends StatefulWidget {
  const QiblatFinderScreen({super.key});

  @override
  State<QiblatFinderScreen> createState() => _QiblatFinderScreenState();
}

class _QiblatFinderScreenState extends State<QiblatFinderScreen> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qiblat Finder'),
        actions: [
          const Tooltip(
            triggerMode: TooltipTriggerMode.tap,
            message:
                'This Feature need Location Permission and Magnetometer Sensor',
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.info_outline_rounded),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.data == false) {
            return const Center(child: Text('Device not supported'));
          }
          return const QiblahDirection();
        },
      ),
    );
  }
}

class QiblahDirection extends StatefulWidget {
  const QiblahDirection({super.key});

  @override
  State<QiblahDirection> createState() => _QiblahDirectionState();
}

class _QiblahDirectionState extends State<QiblahDirection>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;
  double _begin = 0.0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  correctPosition(int qiblahDirection) {
    if (qiblahDirection >= 355 && qiblahDirection <= 360 ||
        qiblahDirection >= 0 && qiblahDirection <= 5) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final qiblahDirection = snapshot.data;
        if (qiblahDirection == null) {
          return Center(
            child: Column(
              spacing: 20,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_disabled_rounded,
                  size: screenHeight(context) * .1,
                ),
                Text(
                  'Need location permission',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TFilledButton(
                  label: 'Enable Location',
                  onPressed: () {
                    getUserLocation();
                  },
                ),
              ],
            ),
          );
        }

        // handling  value if it is negative or greater than 360
        double qiblah = qiblahDirection.qiblah;
        if (qiblah < 0) {
          qiblah = 360 + qiblah; // handling negative value
        } else if (qiblah >= 360) {
          qiblah = qiblah % 360; // handing greater than 360
        }

        // Convert to radian (back clockwise rotation)
        final double radians = (360 - qiblah) * (pi / 180);

        // Update animation
        _animation = Tween(
          begin: _begin,
          end: radians,
        ).animate(_animationController!);
        _begin = radians;
        _animationController!.forward(from: 0);

        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${qiblah.toInt()}°",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TAssetImage(
                Assets.images.kaaba.path,
                width: screenWidth(context) * .4,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: screenWidth(context) * .2,
                color:
                    correctPosition(qiblah.toInt()) ? Colors.green : Colors.red,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        correctPosition(qiblah.toInt())
                            ? Colors.green
                            : Colors.red,
                    width: 2,
                  ),
                ),
                child: AnimatedBuilder(
                  animation: _animation!,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animation!.value,
                      child: Icon(
                        Icons.keyboard_double_arrow_up_rounded,
                        size: screenWidth(context) * .3,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
