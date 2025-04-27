import 'package:flutter/material.dart';
import '../../../../core/components/asset_image.dart';
import '../../../../core/components/button/filled_button.dart';
import '../../../../generated/assets.gen.dart';
import '../../../../utils/color.dart';
import '../../../../utils/ui_helper.dart';

class FloatingMiddleCard extends StatelessWidget {
  const FloatingMiddleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.fromLTRB(20, screenHeight(context) * .32, 20, 0),
      child: SizedBox(
        height: screenHeight(context) * .12,
        width: double.maxFinite,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last Read',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.black54),
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        TAssetImage(Assets.icons.bookSaved, height: 28),
                        Expanded(
                          child: Text(
                            'Sholat Course 7',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                TAssetImage(Assets.images.quranBg.path),
                Center(
                  child: TFilledButton(
                    label: 'Continue',
                    onPressed: () {},
                    backgroundColor: TColors.orange,
                    borderRadius: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
