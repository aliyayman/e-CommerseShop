import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/pages/cartDetails.dart';
import 'package:flutter_application_1/product/pages/favoritePage.dart';
import 'package:flutter_application_1/product/pages/profilePage.dart';
import 'package:flutter_application_1/product/utility/constants/color_constants.dart';
import 'package:flutter_application_1/product/utility/constants/string_constants.dart';

import 'homePageScreen.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentIndex = 0;
  List screens = [
    const homePageScreen(),
    const favoritePage(),
    const profilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartDetails(),
                  )),
              icon: Icon(Icons.add_shopping_cart))
        ],
        title: Text(StringConstants.appTitle),
        backgroundColor: ColorConstant.colorRed,
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: ColorConstant.colorRed,
          unselectedItemColor: ColorConstant.colorGrey,
          onTap: (value) {
            setState(() => currentIndex = value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: StringConstants.homeLabel,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: StringConstants.favoriteLabel),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: StringConstants.profileLabel),
          ]),
    );
  }
}
