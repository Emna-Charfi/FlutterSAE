import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workshop_2/entities/user_entity.dart';

class ServiceUser {

  // WEB SERVICE


  //LOcal

  //Add User
  Future<void> CreateUser (User user) async {
    Database database = await openDatabase(join(await getDatabasesPath(), 'data.db'), version: 1, onCreate: (db, version) async{
     await db.execute('CREATE TABLE Users (_id INTEGER PRIMARY KEY autoincrement NOT NULL, name TEXT, pasw TEXT');
    },);

    //Object
    Map<String , dynamic> obj ={
      "name" : user.nom,
      "pasw": user.password
    };

    //Insert
    await database.insert("Users", obj);
  }

  //ADD
  Future<void> saveTokenAction(String accessToken) async{
      await SharedPreferences.getInstance().then((sp) => sp.setString("accesToken", accessToken));
  }

  //GEt

  Future<String> getAccessToken() async{
    return await SharedPreferences.getInstance().then((sp) => sp.getString("accesToken")! );
  }
}