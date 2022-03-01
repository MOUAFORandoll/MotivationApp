class FavoriteModel {
  int? id;
  String? dateFavorite;
  Publication? publication;
  User? user;

  FavoriteModel({this.id, this.dateFavorite, this.publication, this.user});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateFavorite = json['dateFavorite'];
    publication = json['publication'] != null
        ? new Publication.fromJson(json['publication'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateFavorite'] = this.dateFavorite;
    if (this.publication != null) {
      data['publication'] = this.publication!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Publication {
  int? id;
  String? content;
  String? dateCreate;

  Publication({this.content, this.dateCreate});

  Publication.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    dateCreate = json['dateCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['dateCreate'] = this.dateCreate;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? nom;
  String? prenom;
  String? numero;

  User({this.id, this.email, this.nom, this.prenom, this.numero});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nom = json['nom'];
    prenom = json['prenom'];
    numero = json['numero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['numero'] = this.numero;
    return data;
  }
}
