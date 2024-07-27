
class Organisateur {
  int? organisateurId;
  String? organisateurNom;

  Organisateur({
        required this.organisateurId,
        required this.organisateurNom
  });

  Organisateur.fromJson(Map<String, dynamic> json) {
    organisateurId = json['organisateur_id'];
    organisateurNom = json['organisateur_nom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organisateur_id'] = this.organisateurId;
    data['organisateur_nom'] = this.organisateurNom;
    return data;
  }

}