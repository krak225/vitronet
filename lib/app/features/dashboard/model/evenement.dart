
class Evenement {
  int? evenementId;
  String? evenementLibelle;
  int? evenementNombreTotalTickets;
  int? evenementNombreTicketsVerifies;
  int? evenementNombreTicketsNonVerifies;
  String? evenementDate;
  String? evenementDateCreation;
  String? evenementStatut;

  Evenement({required this.evenementId,
        required this.evenementLibelle,
        required this.evenementNombreTotalTickets,
        required this.evenementNombreTicketsVerifies,
        required this.evenementNombreTicketsNonVerifies,
        required this.evenementDate,
        required this.evenementDateCreation,
        required this.evenementStatut});

  Evenement.fromJson(Map<String, dynamic> json) {
    evenementId = json['evenement_id'];
    evenementLibelle = json['evenement_libelle'];
    evenementNombreTotalTickets = json['evenement_nombre_total_tickets'];
    evenementNombreTicketsVerifies = json['evenement_nombre_tickets_verifies'];
    evenementNombreTicketsNonVerifies = json['evenement_nombre_tickets_non_verifies'];
    evenementDate = json['evenement_date'];
    evenementDateCreation = json['evenement_date_creation'];
    evenementStatut = json['evenement_statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['evenement_id'] = this.evenementId;
    data['evenement_libelle'] = this.evenementLibelle;
    data['evenement_nombre_total_tickets'] = this.evenementNombreTotalTickets;
    data['evenement_nombre_tickets_verifies'] = this.evenementNombreTicketsVerifies;
    data['evenement_nombre_tickets_non_verifies'] = this.evenementNombreTicketsNonVerifies;
    data['evenement_date'] = this.evenementDate;
    data['evenement_date_creation'] = this.evenementDateCreation;
    data['evenement_statut'] = this.evenementStatut;
    return data;
  }
}
