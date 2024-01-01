import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/rive_asset.dart';
import 'menu_items.dart';

class MenuBuilder extends StatelessWidget {
  const MenuBuilder({super.key, required this.items, required this.handleMenuItemTap, required this.selectedSideNav});

  final List<RiveAsset> items;
  final Function handleMenuItemTap;
  final RiveAsset selectedSideNav;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        for (int index = 0; index < items.length; index++)
          GestureDetector(
            onTap: () => handleMenuItemTap(items[index], index),
            child: MenuItems(
              index: index,
              selectedsideNav: selectedSideNav,
              sideNavs: items,
            ),
          ),
        const Divider(
          color: Colors.white10,
          thickness: 1,
        ),
      ],
    );
  }
}
