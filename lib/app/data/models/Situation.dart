class Situation {
  int situationId;
  String situationLibelle;
  String situationDateCrea;
  String situationStatut;

  Situation({
    required this.situationId,
    required this.situationLibelle,
    required this.situationDateCrea,
    required this.situationStatut,
  });

  factory Situation.fromJson(Map<String, dynamic> json) {
    return Situation(
      situationId: json['situation_id'],
      situationLibelle: json['situation_lib'],
      situationDateCrea: json['situation_datecrea'],
      situationStatut: json['situation_statut'],
    );
  }
}