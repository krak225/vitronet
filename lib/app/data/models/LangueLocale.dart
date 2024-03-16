class LangueLocale {
  int langueLocalId;
  String langueLocalLibelle;
  String langueLocalDateCrea;
  String langueLocalStatut;

  LangueLocale({
    required this.langueLocalId,
    required this.langueLocalLibelle,
    required this.langueLocalDateCrea,
    required this.langueLocalStatut,
  });

  factory LangueLocale.fromJson(Map<String, dynamic> json) {
    return LangueLocale(
      langueLocalId: json['languelocal_id'],
      langueLocalLibelle: json['languelocal_lib'],
      langueLocalDateCrea: json['languelocal_datecrea'],
      langueLocalStatut: json['languelocal_statut'],
    );
  }
}