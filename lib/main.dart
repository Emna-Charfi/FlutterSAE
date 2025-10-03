import 'package:flutter/material.dart';
import 'package:workshop_2/basket/basket.dart';
import 'package:workshop_2/entities/game.dart';
import 'package:workshop_2/exples/nav_buttom.dart';
import 'package:workshop_2/exples/nav_tab_bar.dart';
import 'package:workshop_2/navigations/nav_bar.dart';
import 'package:workshop_2/views/details_game.dart';
import 'package:workshop_2/views/home_views/home_page.dart';
import 'package:workshop_2/views/game_views/game_page.dart';
import 'package:workshop_2/views/user_views/reset_password.dart';
import 'package:workshop_2/views/user_views/signin_page.dart';
import 'package:workshop_2/views/user_views/signup_page.dart';
import 'package:workshop_2/views/user_views/update_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        
        "/": (context) => const NavTabBarPage(),
        "/signin":(context) => const SigninPage(),
        "/home":(context) => const HomePage(),
        "/game": (context) => GamePage(),
        "/basket":(context) => const Basket(),
        "/signup":(context) =>  SignupPage(),
        "/update/profil":(context) => const UpdateUser(),
        "reset/password":(context) => const ResetPassword(),
        
      },
      //home:   const UpdateUser(),
      //DetailPanier(game: Game("DMC5", "dmc5.jpg", 200)),
    );
  }
}

