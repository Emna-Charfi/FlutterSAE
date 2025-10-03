import 'package:flutter/material.dart';
import 'package:workshop_2/basket/basket.dart';
import 'package:workshop_2/exples/nav_buttom.dart';
import 'package:workshop_2/views/home_views/home_page.dart';
import 'package:workshop_2/views/game_views/game_page.dart';

class NavTabBarPage extends StatefulWidget {
  const NavTabBarPage({super.key});

  @override
  State<NavTabBarPage> createState() => _NavTabBarPageState();
}

class _NavTabBarPageState extends State<NavTabBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("G-Store ESPRIT"),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.article),
              text: "Game",
            ),
            Tab(
              icon: Icon(Icons.shopping_basket_outlined),
              text: "Panier",
            )
          ]),
        ),
        body: TabBarView(children: [const HomePage(), GamePage(), const Basket()]),
        drawer: Drawer(
          child: Column(
            children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: const Text("G-Store ESPRIT"),
            ),
            ListTile(
              title: const Text("Modifier Profil"),
              onTap: () {
                Navigator.pushNamed(context, "/home/updateUser");
              },
            ),
            ListTile(
              title: const Text("Navigation de bas"),
              onTap: () {
                //Navigator.pushNamed(context, "/home/navbottom");
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NavigationBottom()),
                );
              },
            )
            ],
            
          ),
        ),
      ),
    );
  }
}