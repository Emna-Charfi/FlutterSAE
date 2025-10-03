

import 'package:flutter/material.dart';
import 'package:workshop_2/entities/game.dart';
import 'package:workshop_2/services/service_game.dart';

class DetailPanier extends StatefulWidget {
  final Game game;
   DetailPanier({super.key, required this.game});

  final int count= 3000;

  @override
  State<DetailPanier> createState() => _DetailPanierState();
}

class _DetailPanierState extends State<DetailPanier> {
  @override
  void initState() {
   // widget.count = 3000;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text("About Game",style: TextStyle(color: Colors.white)), ), backgroundColor: Colors.blueAccent,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context,false),),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.asset("assets/images/${widget.game.image}"),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            const Center(child:  Text("The game was originally conceived by Capcom developers as Resident Evil 4. Due to the staff feeling it would not fit the Resident Evil franchise, the project became its own title. Several gameplay elements were also inspired by a bug found in Onimusha: Warlords. Devil May Cry received prominent coverage in the video game media due to the impact it had in the action-adventure genre, its high difficulty, and the high overall scores given to it by professional reviewers. The game has sold more than three million copies,[6] spawned multiple sequels and a prequel, and is considered among the greatest video games of all time.")),
            Center(child: Text("${widget.game.prix}TND", style: const TextStyle(fontSize: 40),)),
             Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Exemplaires dispoibles :"),
                Text(widget.count.toString()),
              ],
            ),
            const SizedBox(height: 10,),
            Center(
              child: ElevatedButton.icon(onPressed: ()async {
                //save to basket

               await ServiceGame().saveBasketItem(widget.game, context);
              showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: const Text("Succes"),
          content: const Text("Game added to basket"),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: const Text("ok")),
          ],
        );
      },);

              //   setState(() {
              //    widget.count --;
              //  });

              },
              
               icon: const Icon(Icons.shopping_basket), label: const Text("Acheter")),
            )
          ],
        ),
      ),
    );
  }
}