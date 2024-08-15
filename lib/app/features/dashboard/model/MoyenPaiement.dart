
class MoyenPaiement {
  int? moyenPaiementId;
  String? moyenPaiementLibelle;

  MoyenPaiement({
        required this.moyenPaiementId,
        required this.moyenPaiementLibelle
  });

  MoyenPaiement.fromJson(Map<String, dynamic> json) {
    moyenPaiementId = json['moyen_paiement_id'];
    moyenPaiementLibelle = json['moyen_paiement_libelle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moyen_paiement_id'] = this.moyenPaiementId;
    data['moyen_paiement_libelle'] = this.moyenPaiementLibelle;
    return data;
  }

}