import 'package:amazonclone/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottonNavigationBarWidth = 42;
  double bottomBarWidth = 5;

  List<Widget> pages = [
    Container(),
    Container(),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 27.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/amazon_in.png",
                      width: 120,
                      height: 50,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Text(
                      "Admin",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
