import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/pages/cart_details.dart';
import 'package:flutter_application_1/product/pages/favoritePage.dart';
import 'package:flutter_application_1/product/pages/profilePage.dart';

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
        title: Text('E-Commerse Shop'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            setState(() => currentIndex = value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
