class SaveModel {
  int ? id;
  String  ?dateSave;
  String  ?publication;
  String ? user;

  SaveModel({this.id, this.dateSave, this.publication, this.user});

  SaveModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateSave = json['dateSave'];
    publication = json['publication'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateSave'] = this.dateSave;
    data['publication'] = this.publication;
    data['user'] = this.user;
    return data;
  }
}
