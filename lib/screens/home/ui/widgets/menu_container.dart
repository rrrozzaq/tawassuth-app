import 'package:flutter/material.dart';
import '../../../../core/components/asset_image.dart';
import '../../../../generated/assets.gen.dart';
import '../../../../utils/color.dart';
import '../../../../utils/ui_helper.dart';

class MenuContainer extends StatefulWidget {
  const MenuContainer({super.key});

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  late List<FeatureMenuContainer> featureMenu;

  @override
  void initState() {
    featureMenu = [
      FeatureMenuContainer(
        bgColor: TColors.orange,
        iconPath: Assets.icons.scholars,
        title: 'Scholars',
        onTap: () {},
      ),
      FeatureMenuContainer(
        bgColor: TColors.darkBlueBg,
        iconPath: Assets.icons.quran,
        title: 'Quran',
        onTap: () {},
      ),
      FeatureMenuContainer(
        bgColor: TColors.purpleAccent,
        iconPath: Assets.icons.compass,
        title: 'Qiblat',
        onTap: () {},
      ),
      FeatureMenuContainer(
        bgColor: TColors.orangeAccent,
        iconPath: Assets.icons.moreIcon,
        title: 'More',
        onTap: () {},
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: screenHeight(context) * .38),
      padding: EdgeInsets.fromLTRB(20, screenHeight(context) * .08, 20, 20),
      constraints: BoxConstraints(minHeight: screenHeight(context) * .7),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: featureMenu,
          ),
        ],
      ),
    );
  }
}

class FeatureMenuContainer extends StatelessWidget {
  const FeatureMenuContainer({
    super.key,
    required this.bgColor,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  final Color bgColor;
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.amber,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TAssetImage(iconPath, height: 40),
          ),
        ),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.black87),
        ),
      ],
    );
  }
}
