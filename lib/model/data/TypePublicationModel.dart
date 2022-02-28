class TypePublicationModel {
  int? id;
  String? libelle;

  TypePublicationModel({this.id, this.libelle});

  TypePublicationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['libelle'] = this.libelle;
    return data;
  }
}
