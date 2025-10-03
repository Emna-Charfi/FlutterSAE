import 'package:flutter/material.dart';
import 'package:workshop_2/entities/game.dart';



class ElementInfo extends StatelessWidget {
  final Game game;
  const ElementInfo({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.restore_from_trash_rounded,
              size: 50,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Image.asset("assets/images/"+game.image, height: 58),
            ),
            Text(
              "${game.prix} TND",
              textScaleFactor: 2,
            ),
          ],
        ),
      ),
    );
  }
}
