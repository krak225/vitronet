
class Ticket {
  int? ticketId;
  String? ticketQrcode;
  int? ticketMontant;
  String? ticketDateCreation;
  String? ticketDateVerification;
  String? ticketStatut;

  Ticket({required this.ticketId,
        required this.ticketQrcode,
        required this.ticketMontant,
        required this.ticketDateCreation,
        required this.ticketDateVerification,
        required this.ticketStatut});

  Ticket.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    ticketQrcode = json['ticket_qrcode'];
    ticketMontant = json['ticket_montant'];
    ticketDateCreation = json['ticket_date_creation'];
    ticketDateVerification = json['ticket_date_verification'];
    ticketStatut = json['ticket_statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_id'] = this.ticketId;
    data['ticket_qrcode'] = this.ticketQrcode;
    data['ticket_montant'] = this.ticketMontant;
    data['ticket_date_creation'] = this.ticketDateCreation;
    data['ticket_date_verification'] = this.ticketDateVerification;
    data['ticket_statut'] = this.ticketStatut;
    return data;
  }
}
