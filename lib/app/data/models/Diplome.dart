class Diplome {
  int diplomeId;
  String diplomelib;
  String diplomeDatecrea;
  String diplomeStatut;

  Diplome({
    required this.diplomeId,
    required this.diplomelib,
    required this.diplomeDatecrea,
    required this.diplomeStatut,
  });

  factory Diplome.fromJson(Map<String, dynamic> json) {
    return Diplome(
      diplomeId: json['diplome_id'],
      diplomelib: json['diplomelib'],
      diplomeDatecrea: json['diplome_datecrea'],
      diplomeStatut: json['diplome_statut'],
    );
  }
}