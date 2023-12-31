import 'package:amazonclone/constants/global_constants.dart';
import 'package:amazonclone/features/account/screen/account_screen.dart';
import 'package:amazonclone/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottonNavigationBarWidth = 42;
  double bottomBarWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text("Cart Page")),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        onTap: updatePage,
        items: <BottomNavigationBarItem>[
          //  Home Tab Item
          BottomNavigationBarItem(
            icon: Container(
              width: bottonNavigationBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 0
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.backgroundColor,
                  width: bottomBarWidth,
                ),
              )),
              child: const Icon(Icons.home_outlined),
            ),
            label: "",
          ),
          // Account Tab Item
          BottomNavigationBarItem(
            icon: Container(
              width: bottonNavigationBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 1
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.backgroundColor,
                  width: bottomBarWidth,
                ),
              )),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: "",
          ),

          // CART Tab Item
          BottomNavigationBarItem(
            icon: Container(
              width: bottonNavigationBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 2
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.backgroundColor,
                  width: bottomBarWidth,
                ),
              )),
              child: const badges.Badge(
                badgeContent: Text("2"),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.transparent,
                  elevation: 0,
                ),
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
