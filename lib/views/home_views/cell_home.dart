import 'package:flutter/material.dart';
import 'package:workshop_2/entities/game.dart';


class CellHomePage extends StatelessWidget {
  final Game game;
  const CellHomePage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(right: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Image.asset("assets/images/${game.image}", height: 100,),
            // Image.network(game.image, 
            // height: 150,),
            Column(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(game.title)),
                Text(game.prix.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),
      ),
    );
  }
}