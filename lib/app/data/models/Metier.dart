class Metier {
  int metierId;
  String metierLibelle;
  String metierDateCrea;
  String metierStatut;

  Metier({
    required this.metierId,
    required this.metierLibelle,
    required this.metierDateCrea,
    required this.metierStatut,
  });

  factory Metier.fromJson(Map<String, dynamic> json) {
    return Metier(
      metierId: json['metier_id'],
      metierLibelle: json['metier_libelle'],
      metierDateCrea: json['metier_datecrea'],
      metierStatut: json['metier_statut'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['metier_id'] = this.metierId;
    data['metier_libelle'] = this.metierLibelle;
    data['metier_datecrea'] = this.metierDateCrea;
    data['metier_statut'] = this.metierStatut;
    return data;
  }
}
