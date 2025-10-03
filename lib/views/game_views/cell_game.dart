import 'package:flutter/material.dart';
import 'package:workshop_2/entities/game.dart';
import 'package:workshop_2/views/details_game.dart';

class CellGame extends StatelessWidget {
  final Game game;
  const CellGame(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) =>  DetailPanier(game: game,)),);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/${game.image}"),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Text(game.title),
          ],
        ),
      ),
    );
  }
}