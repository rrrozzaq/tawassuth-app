import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/components/drawer_app.dart';
import '../data/menu_model.dart';
import 'widgets/hero_card.dart';
import 'widgets/menu_list.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<MenuModel> menuList;

  @override
  void initState() {
    super.initState();

    menuList = [
      MenuModel(
        title: 'Quran',
        icon: Icons.quora_rounded,
        onTap: () {
          showComingSoon();
        },
      ),
      MenuModel(
        title: 'Scholars',
        icon: Icons.theater_comedy_rounded,
        onTap: () {
          context.router.back();
        },
      ),
      MenuModel(
        title: 'Prayers Times',
        icon: Icons.access_time_rounded,
        onTap: () {
          showComingSoon();
        },
      ),
      MenuModel(
        title: 'Aamals',
        icon: Icons.handshake,
        onTap: () {
          showComingSoon();
        },
      ),
      // add new menu here
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tawassuth'), centerTitle: false),
      drawer: const TDrawer(),
      body: Column(
        children: [const THeroCardWidget(), MenuList(menuList: menuList)],
      ),
    );
  }

  void showComingSoon() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
        dismissDirection: DismissDirection.horizontal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        showCloseIcon: true,
        content: Text('Coming soon'),
      ),
    );
  }
}
