class Ville {
  int? villeId;
  String? villeLibelle;
  String? villeStatut;

  Ville({required this.villeId, required this.villeLibelle, required this.villeStatut});

  Ville.fromJson(Map<String, dynamic> json) {
    villeId = json['ville_id'];
    villeLibelle = json['ville_libelle'];
    villeStatut = json['ville_statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ville_id'] = this.villeId;
    data['ville_libelle'] = this.villeLibelle;
    data['ville_statut'] = this.villeStatut;
    return data;
  }
}