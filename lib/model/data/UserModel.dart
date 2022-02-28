class UserModel {
  int? id;
  String? email;
  String? nom;
  String? prenom;
  String? numero;
  List<String>? comments;
  List<String>? favories;
  List<String>? publications;
  List<String>? partages;
  List<String>? abonnements;
  List<String>? likes;
  List<String>? messages;
  String? partage;

  UserModel(
      {this.id,
      this.email,
      this.nom,
      this.prenom,
      this.numero,
      this.comments,
      this.favories,
      this.publications,
      this.partages,
      this.abonnements,
      this.likes,
      this.messages,
      this.partage});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nom = json['nom'];
    prenom = json['prenom'];
    numero = json['numero'];
    comments = json['comments'].cast<String>();
    favories = json['favories'].cast<String>();
    publications = json['publications'].cast<String>();
    partages = json['partages'].cast<String>();
    abonnements = json['abonnements'].cast<String>();
    likes = json['likes'].cast<String>();
    messages = json['messages'].cast<String>();
    partage = json['partage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['numero'] = this.numero;
    data['comments'] = this.comments;
    data['favories'] = this.favories;
    data['publications'] = this.publications;
    data['partages'] = this.partages;
    data['abonnements'] = this.abonnements;
    data['likes'] = this.likes;
    data['messages'] = this.messages;
    data['partage'] = this.partage;
    return data;
  }
}
