class NiveauInstruction {
  int niveauId;
  String niveauLibelle;
  String niveauDateCrea;
  String niveauInstructionStatut;

  NiveauInstruction({
    required this.niveauId,
    required this.niveauLibelle,
    required this.niveauDateCrea,
    required this.niveauInstructionStatut,
  });

  factory NiveauInstruction.fromJson(Map<String, dynamic> json) {
    return NiveauInstruction(
      niveauId: json['niveau_id'],
      niveauLibelle: json['niveau_lib'],
      niveauDateCrea: json['niveau_datecrea'],
      niveauInstructionStatut: json['niveauinstruction_statut'],
    );
  }
}