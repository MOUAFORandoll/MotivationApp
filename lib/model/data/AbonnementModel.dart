class AbonnementModel {
  int? id;
  String? dateAbonnement;
  String? user;

  AbonnementModel({this.id, this.dateAbonnement, this.user});

  AbonnementModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateAbonnement = json['dateAbonnement'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateAbonnement'] = this.dateAbonnement;
    data['user'] = this.user;
    return data;
  }
}
