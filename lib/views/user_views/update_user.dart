import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  late String? currentPassword;
  late String? newPassword;
  late String? address;

  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètres du profil", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(icon:const  Icon(Icons.arrow_back), onPressed: () {
          Navigator.pop(context,false);
        },),
      ),
      body: Form(
        key: keyForm,
        child: ListView(
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Image.asset("assets/images/minecraft.jpg",
                    width: 460, height: 215)),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mot de passe actuel"),
                onSaved: (String? value) {
                  currentPassword = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Le mot de passe ne doit pas etre vide";
                  } else if (value.length < 5) {
                    return "Le mot de passe doit avoir au moins 5 caractères";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nouveau mot de passe"),
                onSaved: (String? value) {
                  newPassword = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Le mot de passe ne doit pas etre vide";
                  } else if (value.length < 5) {
                    return "Le mot de passe doit avoir au moins 5 caractères";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Adresse de facturation"),
                onSaved: (String? value) {
                  address = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "L'adresse email ne doit pas etre vide";
                  } else if (value.length < 20) {
                    return "L'adresse doit avoir au moins 20 caractères";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: ElevatedButton(
                child: const Text("Enregistrer"),
                onPressed: () {
                  if (keyForm.currentState!.validate()) {
                    keyForm.currentState!.save();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
