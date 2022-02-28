class PublicationModel {
  int? id;
  String? content;
  String? dateCreate;
  List<String>? favories;
  List<String>? comments;
  List<String>? likes;
  User? user;
  String? typePublication;
  List<String>? partages;

  PublicationModel(
      {this.id,
      this.content,
      this.dateCreate,
      this.favories,
      this.comments,
      this.likes,
      this.user,
      this.typePublication,
      this.partages});

  PublicationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    dateCreate = json['dateCreate'];
    favories = json['favories'].cast<String>();
    comments = json['comments'].cast<String>();
    likes = json['likes'].cast<String>();
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    typePublication = json['typePublication'];
    partages = json['partages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['dateCreate'] = this.dateCreate;
    data['favories'] = this.favories;
    data['comments'] = this.comments;
    data['likes'] = this.likes;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['typePublication'] = this.typePublication;
    data['partages'] = this.partages;
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
