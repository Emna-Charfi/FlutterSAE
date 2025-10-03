class Game{
  final String title, image;
  final String prix;
  late String id;

  Game(this.title, this.image,this.prix);
  

  //Serialisation

  Map<String, dynamic> toJson(){

    return{
      "Title": title, "Poster": image, "Runtime": prix
    };

  }

  //Déserialisation

  static Game fromJson(Map<String, dynamic> jsonData){
      return Game(jsonData["Title"], jsonData["Poster"], jsonData["Runtime"]);
  }

  

  @override
  String toString() {
    return "title: ${title}image:$image";
  }
}