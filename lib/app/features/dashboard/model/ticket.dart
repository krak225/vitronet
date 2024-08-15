
import 'package:hello_depart/app/features/dashboard/model/MoyenPaiement.dart';
import 'package:hello_depart/app/features/dashboard/model/client.dart';

class Ticket {
  int? ticketId;
  String? ticketQrcode;
  int? ticketMontant;
  String? ticketNomAcheteur;
  String? ticketTelephoneAcheteur;
  String? ticketTelephonePaiement;
  String? ticketNomBeneficiaire;
  String? ticketDateCreation;
  String? ticketDateVerification;
  String? ticketStatut;
  Client? clientAcheteur;
  Client? clientBeneficiaire;
  MoyenPaiement? moyenPaiement;

  Ticket({required this.ticketId,
        required this.ticketQrcode,
        required this.ticketMontant,
        required this.ticketNomAcheteur,
        required this.ticketTelephonePaiement,
        required this.ticketNomBeneficiaire,
        required this.ticketDateCreation,
        required this.ticketDateVerification,
        required this.ticketStatut,
        required this.clientAcheteur,
        required this.clientBeneficiaire,
        required this.moyenPaiement});

  Ticket.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    ticketQrcode = json['ticket_qrcode'];
    ticketMontant = json['ticket_montant'];
    ticketNomAcheteur = json['ticket_nom_acheteur'];
    ticketTelephonePaiement = json['ticket_telephone_paiement'];
    ticketNomBeneficiaire = json['ticket_nom_beneficiaire'];
    ticketDateCreation = json['ticket_date_creation'];
    ticketDateVerification = json['ticket_date_verification'];
    ticketStatut = json['ticket_statut'];
    clientAcheteur = json['client_acheteur'] != null ? new Client.fromJson(json['client_acheteur']) : null;
    clientBeneficiaire = json['client_beneficiaire'] != null ? new Client.fromJson(json['client_beneficiaire']) : null;
    moyenPaiement = json['moyen_paiement'] != null ? new MoyenPaiement.fromJson(json['moyen_paiement']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_id'] = this.ticketId;
    data['ticket_qrcode'] = this.ticketQrcode;
    data['ticket_montant'] = this.ticketMontant;
    data['ticket_montant'] = this.ticketNomAcheteur;
    data['ticket_montant'] = this.ticketTelephonePaiement;
    data['ticket_montant'] = this.ticketNomBeneficiaire;
    data['ticket_date_creation'] = this.ticketDateCreation;
    data['ticket_date_verification'] = this.ticketDateVerification;
    data['ticket_statut'] = this.ticketStatut;
    final client_acheteur = this.clientAcheteur;
    if (client_acheteur != null) {
      data['client_acheteur'] = client_acheteur.toJson();
    }
    final client_beneficiaire = this.clientBeneficiaire;
    if (client_beneficiaire != null) {
      data['client_beneficiaire'] = client_beneficiaire.toJson();
    }
    final moyen_paiement = this.moyenPaiement;
    if (moyen_paiement != null) {
      data['moyen_paiement'] = moyen_paiement.toJson();
    }
    return data;
  }
}
