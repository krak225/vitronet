
class Evenement {
  int? evenementId;
  String? evenementLibelle;
  int? evenementMontantTotalTicket;
  int? evenementMontantTicketVerifies;
  String? evenementDate;
  String? evenementDateCreation;
  String? evenementStatut;

  Evenement({required this.evenementId,
        required this.evenementLibelle,
        required this.evenementMontantTotalTicket,
        required this.evenementMontantTicketVerifies,
        required this.evenementDate,
        required this.evenementDateCreation,
        required this.evenementStatut});

  Evenement.fromJson(Map<String, dynamic> json) {
    evenementId = json['evenement_id'];
    evenementLibelle = json['evenement_libelle'];
    evenementMontantTotalTicket = json['evenement_montant_total_ticket'];
    evenementMontantTicketVerifies = json['evenement_montant_ticket_verifies'];
    evenementDate = json['evenement_date'];
    evenementDateCreation = json['evenement_date_creation'];
    evenementStatut = json['evenement_statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['evenement_id'] = this.evenementId;
    data['evenement_libelle'] = this.evenementLibelle;
    data['evenement_montant_total_ticket'] = this.evenementMontantTotalTicket;
    data['evenement_montant_ticket_verifies'] = this.evenementMontantTicketVerifies;
    data['evenement_date'] = this.evenementDate;
    data['evenement_date_creation'] = this.evenementDateCreation;
    data['evenement_statut'] = this.evenementStatut;
    return data;
  }
}
