import 'package:flutter/material.dart';
import 'package:workshop_2/entities/game.dart';
import 'package:workshop_2/views/game_views/cell_game.dart';

class GamePage extends StatelessWidget {
   GamePage({super.key});
  final List<Game> games = [
        Game("DMC5", "dmc5.jpg", "200"),
        Game("FIFA", "fifa.jpg", "200"),
        Game("Minecraft", "minecraft.jpg", "200"),
        Game("NFS", "nfs.jpg", "200"),
        Game("RDR", "rdr2.jpg", "200"),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemCount: games.length,
      itemBuilder: (context, index) {
        return CellGame(games[index]);
      },)
      // GridView.count(crossAxisCount: 2, children: [
      //     CellPanier( games[0]),
      //     CellPanier( games[1]),
      //     CellPanier( games[2]),
      // ])
      ,
    );
  }
}