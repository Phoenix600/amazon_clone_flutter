import 'package:amazonclone/constants/global_constants.dart';
import 'package:amazonclone/features/account/widgets/below_app_bar.dart';
import 'package:amazonclone/features/account/widgets/orders.dart';
import 'package:amazonclone/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
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
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(Icons.notifications_outlined),
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: const Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          Orders(),
        ],
      ),
    );
  }
}
