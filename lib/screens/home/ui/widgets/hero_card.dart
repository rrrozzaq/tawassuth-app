import 'package:flutter/material.dart';
import 'package:tawassuth/utils/ui_helper.dart';

class THeroCardWidget extends StatelessWidget {
  const THeroCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(20),
      height: screenHeight(context) * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade800,
            Colors.blue.shade600,
            Colors.blue.shade500,
          ],
        ),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 15,
            children: [
              // Photo Profile user
              CircleAvatar(
                radius: screenWidth(context) * .08,
                child: Icon(Icons.person, size: screenWidth(context) * 0.1),
              ),

              // userData
              Expanded(
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // username
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Drs. Abdul Rozzaq S.T M.T P.T',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Nation User
                    Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on, color: Colors.white),
                        Text(
                          'Indonesia, Jakarta',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall!.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
