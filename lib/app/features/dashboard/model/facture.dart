import 'client.dart';
import 'hellodepart_models.dart';

class Facture {
  int? factureId;
  int? userId;
  int? clientId;
  int? departId;
  String? factureNumero;
  String? factureNomprenomspassager;
  String? factureMobilepassager;
  String? factureOrigine;
  int? factureNbrTicket;
  int? factureMontant;
  int? factureMontantTotal;
  int? factureTotalApayer;
  int? factureTotalTiersOut;
  int? factureCompteCompagnie;
  int? factureParttelcoIn;
  double? factureParttelcoOut1;
  double? factureParttelcoOut2;
  int? facturePartpdv;
  int? facturePartHellodepart;
  int? factureFrais;
  int? factureTimbreEtat;
  int? factureCommission;
  String? factureDateCreation;
  String? factureDatePaiement;
  String? factureStatutPaiement;
  Client? client;
  User? user;
  Depart? depart;

  Facture(
      {required this.factureId,
        required this.userId,
        required this.clientId,
        required this.departId,
        required this.factureNumero,
        required this.factureNomprenomspassager,
        required this.factureMobilepassager,
        required this.factureOrigine,
        required this.factureNbrTicket,
        required this.factureMontant,
        required this.factureMontantTotal,
        required this.factureTotalApayer,
        required this.factureTotalTiersOut,
        required this.factureCompteCompagnie,
        required this.factureParttelcoIn,
        required this.factureParttelcoOut1,
        required this.factureParttelcoOut2,
        required this.facturePartpdv,
        required this.facturePartHellodepart,
        required this.factureFrais,
        required this.factureTimbreEtat,
        required this.factureCommission,
        required this.factureDateCreation,
        required this.factureDatePaiement,
        required this.factureStatutPaiement,
        required this.client,
        required this.user,
        required this.depart});

  Facture.fromJson(Map<String, dynamic> json) {
    factureId = json['facture_id'];
    userId = json['user_id'];
    clientId = json['client_id'];
    departId = json['depart_id'];
    factureNumero = json['facture_numero'];
    factureNomprenomspassager = json['facture_nomprenomspassager'];
    factureMobilepassager = json['facture_mobilepassager'];
    factureOrigine = json['facture_origine'];
    factureNbrTicket = json['facture_nbr_ticket'];
    factureMontant = json['facture_montant'];
    factureMontantTotal = json['facture_montant_total'];
    //factureTotalApayer = json['facture_total_apayer'];
    factureTotalTiersOut = 0;//json['facture_total_tiers_out'].round().toInt();
    factureCompteCompagnie = 0;//json['facture_compte_compagnie'].round().toInt();
    //factureParttelcoIn = json['facture_parttelco_in'];
    //factureParttelcoOut1 = double.parse(json['facture_parttelco_out1'].toString());
    //factureParttelcoOut2 = double.parse(json['facture_parttelco_out2'].toString());
    facturePartpdv = 0;//json['facture_partpdv'].round().toInt();
    facturePartHellodepart = 0;//json['facture_part_hellodepart'].round().toInt();
    factureFrais = json['facture_frais'];
    factureTimbreEtat = json['facture_timbre_etat'];
    factureCommission = json['facture_commission'];
    factureDateCreation = json['facture_date_creation'];
    factureDatePaiement = json['facture_date_paiement'];
    factureStatutPaiement = json['facture_statut_paiement'];
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    depart =
    json['depart'] != null ? new Depart.fromJson(json['depart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facture_id'] = this.factureId;
    data['user_id'] = this.userId;
    data['client_id'] = this.clientId;
    data['depart_id'] = this.departId;
    data['facture_numero'] = this.factureNumero;
    data['facture_nomprenomspassager'] = this.factureNomprenomspassager;
    data['facture_mobilepassager'] = this.factureMobilepassager;
    data['facture_origine'] = this.factureOrigine;
    data['facture_nbr_ticket'] = this.factureNbrTicket;
    data['facture_montant'] = this.factureMontant;
    data['facture_montant_total'] = this.factureMontantTotal;
    data['facture_total_apayer'] = this.factureTotalApayer;
    data['facture_total_tiers_out'] = this.factureTotalTiersOut;
    data['facture_compte_compagnie'] = this.factureCompteCompagnie;
    data['facture_parttelco_in'] = this.factureParttelcoIn;
    data['facture_parttelco_out1'] = this.factureParttelcoOut1;
    data['facture_parttelco_out2'] = this.factureParttelcoOut2;
    data['facture_partpdv'] = this.facturePartpdv;
    data['facture_part_hellodepart'] = this.facturePartHellodepart;
    data['facture_frais'] = this.factureFrais;
    data['facture_timbre_etat'] = this.factureTimbreEtat;
    data['facture_commission'] = this.factureCommission;
    data['facture_date_creation'] = this.factureDateCreation;
    data['facture_date_paiement'] = this.factureDatePaiement;
    data['facture_statut_paiement'] = this.factureStatutPaiement;
    final client = this.client;
    if (client != null) {
      data['client'] = client.toJson();
    }
    final user = this.user;
    if (user != null) {
      data['user'] = user.toJson();
    }
    final depart = this.depart;
    if (depart != null) {
      data['depart'] = depart.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  int? profilId;
  int? villeId;
  int? compagnieId;
  String? organisateur;
  String? nom;
  String? prenoms;
  String? telephone;
  String? adresseGeo;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? dateSuppression;

  User(
      {required this.id,
        required this.profilId,
        required this.villeId,
        required this.compagnieId,
        required this.organisateur,
        required this.nom,
        required this.prenoms,
        required this.telephone,
        required this.adresseGeo,
        required this.email,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.dateSuppression});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profilId = json['profil_id'];
    villeId = json['ville_id'];
    compagnieId = json['compagnie_id'];
    organisateur = json['organisateur'];
    nom = json['nom'];
    prenoms = json['prenoms'];
    telephone = json['telephone'];
    adresseGeo = json['adresse_geo'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    dateSuppression = json['date_suppression'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profil_id'] = this.profilId;
    data['ville_id'] = this.villeId;
    data['compagnie_id'] = this.compagnieId;
    data['nom'] = this.nom;
    data['prenoms'] = this.prenoms;
    data['telephone'] = this.telephone;
    data['adresse_geo'] = this.adresseGeo;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['date_suppression'] = this.dateSuppression;
    return data;
  }
}

