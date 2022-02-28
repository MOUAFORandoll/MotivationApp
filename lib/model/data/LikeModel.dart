class LikesModel {
  int ?id;
  String ? dateLike;
  Publication ? publication;
  User ? user;

  LikesModel({this.id, this.dateLike, this.publication, this.user});

  LikesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateLike = json['dateLike'];
    publication = json['publication'] != null
        ? new Publication.fromJson(json['publication'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateLike'] = this.dateLike;
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
  String ? content;
  String ? dateCreate;

  Publication({this.content, this.dateCreate});

  Publication.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    dateCreate = json['dateCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['dateCreate'] = this.dateCreate;
    return data;
  }
}

class User {
  int  ?id;
  String ? email;
  String  ?nom;
  String ? prenom;
  String ? numero;

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
