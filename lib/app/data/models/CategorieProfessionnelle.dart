class CategorieProfessionnelle {
  int cateproId;
  String cateproLibelle;
  String cateproDateCrea;
  String? cateproStatut;

  CategorieProfessionnelle({
    required this.cateproId,
    required this.cateproLibelle,
    required this.cateproDateCrea,
    this.cateproStatut,
  });

  factory CategorieProfessionnelle.fromJson(Map<String, dynamic> json) {
    return CategorieProfessionnelle(
      cateproId: json['catepro_id'],
      cateproLibelle: json['catepro_lib'],
      cateproDateCrea: json['catepro_datecrea'],
      cateproStatut: json['catepro_statut'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catepro_id'] = this.cateproId;
    data['catepro_lib'] = this.cateproLibelle;
    data['catepro_datecrea'] = this.cateproDateCrea;
    data['catepro_statut'] = this.cateproStatut;
    return data;
  }
}
