import 'dart:math';

import 'package:flutter/material.dart';
import 'package:workshop_2/entities/user_entity.dart';
import 'package:workshop_2/services/service_user.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});
  late String? username, email, mdp,annee, adresse;
  final GlobalKey<FormState> myKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inscription" , style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: myKey,
          child: ListView(
          children: [
            Image.asset("assets/images/minecraft.jpg"),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder()
              ),
              onSaved: (newValue) {
                username = newValue;
              },
              onChanged: (value) {
                
              },
              validator: (value) {
                if(value!.isEmpty){
                  return "the username can't be empty";
                }
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder()
              ),
              onSaved: (newValue) {
                email = newValue;
              },
              onChanged: (value) {
                
              },
              validator: (value) {
                if(value!.isEmpty){
                  return "the email can't be empty";
                }
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Mot de passe",
                border: OutlineInputBorder()
              ),
              onSaved: (newValue) {
                mdp = newValue;
              },
              onChanged: (value) {
                
              },
              validator: (value) {
                if(value!.isEmpty){
                  return "the password can't be empty";
                }
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Année",
                border: OutlineInputBorder()
              ),
              onSaved: (newValue) {
                annee = newValue;
              },
              onChanged: (value) {
                
              },
              validator: (value) {
                if(value!.isEmpty){
                  return "the année can't be empty";
                }
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Adresse",
                border: OutlineInputBorder(),
              ),
              onSaved: (newValue) {
                adresse = newValue;
              },
              onChanged: (value) {
                
              },
              validator: (value) {
                if(value!.isEmpty){
                  return "the adress can't be empty";
                }
              },
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                onPressed :() {
                  if(myKey.currentState!.validate()){
                    myKey.currentState!.save();
                     (context: context, builder: (context) {
                      ServiceUser().CreateUser(User(username!, mdp!));
                      return AlertDialog( title:const  Text("informations"),
                      content: Text("Username$username  \n Email : $email"  ),
                      );
                    },);
                  }
                  
                }, 
                child: const Text("S'inscrit"),),
               ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                onPressed :() {
                
                }, child: const Text("Annuler"),)
             ],
            )
          ],
        )),
      ) ,
    );
  }
}