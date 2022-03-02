class CategorieModel {
  int? id;
  String? libelle;
  

  CategorieModel(
      {this.id,
      this.libelle,
   });

  CategorieModel.fromJson(Map<String, dynamic> json) {
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
 