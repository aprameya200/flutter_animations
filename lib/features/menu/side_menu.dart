import 'package:flutter/material.dart';
import 'package:flutter_animations/features/menu/info_card.dart';
import 'package:flutter_animations/features/menu/menu_builder.dart';
import 'package:flutter_animations/features/menu/menu_title.dart';

import '../../constants.dart';
import '../../utils/rive_asset.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedSideNav = sideNavs[0];
  RiveAsset prevAsset = sideNavs[0];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: darkBlue,
        width: screenWidth * 0.7,
        height: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoCard(),
                const MenuTitle(title: "BROWSE"),
                Container(
                  color: Colors.white10,
                  width: screenWidth * 0.9,
                ),
                const SizedBox(height: 20),
                MenuBuilder(
                    items: sideNavs,
                    handleMenuItemTap: handleMenuItemTap,
                    selectedSideNav: selectedSideNav),
                const MenuTitle(title: "HISTORY"),
                Container(
                  color: Colors.white10,
                  width: screenWidth * 0.9,
                ),
                MenuBuilder(
                    items: historyItems,
                    handleMenuItemTap: handleMenuItemTap,
                    selectedSideNav: selectedSideNav),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleMenuItemTap(RiveAsset item, int index) {
    if (item != selectedSideNav) {
      item.input!.change(true);

      setState(() {
        prevAsset = selectedSideNav;
        selectedSideNav = item;
      });
    }

    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      item.input!.change(false);
    });
  }
}
