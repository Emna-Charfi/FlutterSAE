import 'dart:convert';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workshop_2/entities/game.dart';
import 'package:http/http.dart' as http;

class ServiceGame{
  //WS
  //add
  Future<String> addGame(Game game)async{
    String msg ="Failed";

    //URL
      Uri url = Uri.parse("https://my-json-server.typicode.com/horizon-code-academy/fake-movies-api/movies?fbclid=IwAR304MRa9mMV49o69-RDABYquiKmbwQccUmVXR8kM__MJ_gohW-xYmBZOT8");
    //Header
      var header = {
          "Content-Type": "application/json"
      };
    //Body
      var body = json.encode(game.toJson());

      //Requet 
  await http.post(url, headers: header, body: body).then((response) {
          if(response.statusCode == 200){
           msg= "Create";
          }
      });

    return msg;
  }

  //getAll
  Future<List<Game>> getAll() async{

    List<Game> games = [];

    //URL
      Uri url = Uri.parse("https://my-json-server.typicode.com/horizon-code-academy/fake-movies-api/movies?fbclid=IwAR304MRa9mMV49o69-RDABYquiKmbwQccUmVXR8kM__MJ_gohW-xYmBZOT8");
    //Header
      var header = {
          "Content-Type": "application/json"
      };

    //Requet
      await http.get(url, headers: header).then((response) {
          if(response.statusCode == 200){
          
               List<dynamic> jsonGames = json.decode(response.body);
              //  for (var element in jsonGames) {
              //     games.add(Game.fromJson(element));
              //  }
               for(int i = 0 ; i< jsonGames.length-1; i++){
                games.add(Game.fromJson(jsonGames[i]));
               }
          }
      });
    return  games;
  }

  // LOCAL

  Future<void> saveBasketItem(Game game, BuildContext context)async{

    //db init 
    Database database = await openDatabase(join(await getDatabasesPath(), 'data.db'), version: 1, onCreate: (db, version) async{
     await db.execute('CREATE TABLE Games (_id INTEGER PRIMARY KEY autoincrement NOT NULL, name TEXT, image TEXT, price TEXT)');
    },);

    //Object 
    Map<String, dynamic> object = {
      "name" : game.title,
      "image" : game.image,
      "price" : game.prix
    };

    //Insert

    database.insert("Games", object).then((value) => (value) {
      //close bd
      database.close();
      //Info Dialog
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
      
    });
    
  }

  //Get Basket Game

  Future<List<Game>> getBasketGame() async{
    List <Game> games= [];
    Database database = await openDatabase(join(await getDatabasesPath(), "data.db"), version: 1);

    List<Map<String, dynamic>> map = await database.query("Games");

    for (var item in map) {
      games.add(Game(item['name'], item['image'], item['price']));
    }

    return games;
  }

  
}

 //games.add(Game('DMC5', 'dmc5.jpg', '200'));