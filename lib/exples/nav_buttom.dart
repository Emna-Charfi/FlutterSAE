import 'package:flutter/material.dart';
import 'package:workshop_2/basket/basket.dart';
import 'package:workshop_2/exples/nav_tab_bar.dart';
import 'package:workshop_2/views/game_views/game_page.dart';
import 'package:workshop_2/views/home_views/home_page.dart';
import 'package:workshop_2/views/user_views/update_user.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  final List<Widget> interfaces = [const HomePage(), GamePage(), const Basket()];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("G-Store ESPRIT")),
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
                //Navigator.pushNamed(context, "/home/updateUser");
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const UpdateUser()),
  );
              },
            ),
            ListTile(
              title: const Text("Navigation par ongle"),
              onTap: () {
                //Navigator.pushNamed(context, "/");
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const NavTabBarPage()),
  );
              },
            )
            ],
            
          ),
        ),
      body: interfaces[count],
      bottomNavigationBar: BottomNavigationBar(
        items:const  [
        BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.article,), label: "Game"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket,), label: "Panier"),
      ],
      currentIndex: count,
      onTap: (value) => setState(() {
        count = value;
      }),
      ),
    );
  }
}