class MessageModel {
  int ?  id;
  String ?  content;
  String ?  dateCreate;
  bool ?  status;
  Emetteur ?  emetteur;
  Emetteur ?  recepteur;

  MessageModel(
      {this.id,
      this.content,
      this.dateCreate,
      this.status,
      this.emetteur,
      this.recepteur});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    dateCreate = json['dateCreate'];
    status = json['status'];
    emetteur = json['emetteur'] != null
        ? new Emetteur.fromJson(json['emetteur'])
        : null;
    recepteur = json['recepteur'] != null
        ? new Emetteur.fromJson(json['recepteur'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['dateCreate'] = this.dateCreate;
    data['status'] = this.status;
    if (this.emetteur != null) {
      data['emetteur'] = this.emetteur!.toJson();
    }
    if (this.recepteur != null) {
      data['recepteur'] = this.recepteur!.toJson();
    }
    return data;
  }
}

class Emetteur {
  int  ? id;
  String ?  email;
  String ?  nom;
  String  ? prenom;
  String  ? numero;

  Emetteur({this.id, this.email, this.nom, this.prenom, this.numero});

  Emetteur.fromJson(Map<String, dynamic> json) {
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
