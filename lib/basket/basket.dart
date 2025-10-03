
import 'package:flutter/material.dart';
import 'package:workshop_2/entities/game.dart';
import 'package:workshop_2/services/service_game.dart';

import 'element_info.dart';

class Basket extends StatelessWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            Text(
              "Total : 500 TND",
              textScaleFactor: 1.5,
            )
          ],
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: const Divider(color: Colors.red)),
        Expanded(
         child: FutureBuilder(future: ServiceGame().getBasketGame(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ElementInfo(game: snapshot.data![index],);
                },);
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },),
        )
      ],
    );
  }
}
