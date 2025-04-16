import 'package:flutter/material.dart';

import '../../../../utils/ui_helper.dart';
import '../../data/menu_model.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key, required this.menuList});

  final List<MenuModel> menuList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(menuList.length, (index) {
          return Card(
            child: InkWell(
              onTap: menuList[index].onTap,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: screenWidth(context) * 0.25,
                width: screenWidth(context) * 0.25,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Icon(
                        menuList[index].icon,
                        size: screenWidth(context) * .08,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        menuList[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
