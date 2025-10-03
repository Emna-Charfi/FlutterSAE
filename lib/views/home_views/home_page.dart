import 'package:flutter/material.dart';
import 'package:workshop_2/entities/game.dart';
import 'package:workshop_2/services/service_game.dart';
import 'package:workshop_2/views/home_views/cell_home.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
 
  @override
  Widget build(BuildContext context) {
    List<Game> games = [
        Game("DMC5", "dmc5.jpg", "200"),
        Game("FIFA", "fifa.jpg", "200"),
        Game("Minecraft", "minecraft.jpg", "200"),
        Game("NFS", "nfs.jpg", "200"),
        Game("RDR", "rdr2.jpg", "200"),
    ];
    return Scaffold(
      
      body: FutureBuilder(
        future: ServiceGame().getAll(), 
        builder: (context, snapshot) {
          if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return CellHomePage(game: snapshot.data![index]);
                },);
          }else{
            return const Center(
              child:  CircularProgressIndicator(),
            );
          }
        },)
      
      
      
      // body:ListView(
      //   children: [
      //     CellHomePage(game: games[0]),
      //     CellHomePage(game: games[1]),
      //     CellHomePage(game: games[2]),
      //     CellHomePage(game: games[3]),
      //     CellHomePage(game: games[4]),
      //     CellHomePage(game: games[0]),
      //     CellHomePage(game: games[1]),
      //     CellHomePage(game: games[2]),
      //     CellHomePage(game: games[3]),
      //     CellHomePage(game: games[4]),
      //   ],
      // ) ,
    );
  }
}