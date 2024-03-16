class LangueInternationale {
  int langueInterId;
  String langueInterLibelle;
  String langueInterDateCrea;
  String langueInterStatut;

  LangueInternationale({
    required this.langueInterId,
    required this.langueInterLibelle,
    required this.langueInterDateCrea,
    required this.langueInterStatut,
  });

  factory LangueInternationale.fromJson(Map<String, dynamic> json) {
    return LangueInternationale(
      langueInterId: json['langueinter_id'],
      langueInterLibelle: json['langueinter_lib'],
      langueInterDateCrea: json['langueinter_datecrea'],
      langueInterStatut: json['langueinter_statut'],
    );
  }
}