import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../config/app_constants.dart';
import '../../../constans/app_constants.dart';
import '../../../shared_components/card_task.dart';
import '../../../shared_components/selection_button.dart';
import '../../../shared_components/task_progress.dart';
import '../../../shared_components/user_profile.dart';
import '../../../utils/stdfn.dart';
import '../../../utils/ui/theme/snackbar_ui.dart';
import '../model/Ville.dart';
import '../model/client.dart';
import '../model/facture.dart';
import '../model/hellodepart_models.dart';
import '../model/produit.dart';
import '../model/ticket.dart';

class HomeController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> formKey2 = GlobalKey<FormBuilderState>();

  GetStorage _storage = GetStorage();
  String TOKEN_STORAGE = "";

  final RxBool isLoading = false.obs;
  final RxBool isVerified = false.obs;

  var liste_tickets = <Ticket>[].obs; // Observable list of tickets
  var isLoadingTickets = true.obs; // Variable to track loading state

  late List<Ticket> tickets = List.empty();
  late List<Client> clients = List.empty();
  late List<Produit> produits = List.empty();
  late List<Facture> factures = List.empty();
  late List<Depart> departs = List.empty();
  late List<Ville> villes = List.empty();
  late RxList<CardTaskData> taskInProgress = <CardTaskData>[].obs;

  late RxInt STAT_TODAY = 0.obs;
  late RxInt STAT_TODAY_1 = 0.obs;
  late RxInt STAT_TODAY_2 = 0.obs;
  late RxInt STAT_TODAY_3 = 0.obs;
  late RxInt STAT_TODAY_4 = 0.obs;

  late RxInt ville_depart_id = 0.obs;
  late RxInt ville_destination_id = 0.obs;
  late RxString date_depart = "".obs;
  late RxString search_numero_ticket = "".obs;
  late RxString search_nom_acheteur = "".obs;
  late RxString search_numero_telephone = "".obs;
  late RxString search_date_depart = "".obs;

  //////////
  final dataProfil = const UserProfileData(
    image: AssetImage(ImageUserPath.jemi),
    name: "Armand KOUASSI",
    jobDesk: "Software Engineer",
  );

  final member = ["Avril Kimberly", "Michael Greg"];

  final dataTask = const TaskProgressData(totalTask: 5, totalCompleted: 1);

  void onPressedProfil() {}

  void onSelectedMainMenu(int index, SelectionButtonData value) {
  }

  void onSelectedTaskMenu(int index, String label) {
    print(index);
  }

  void searchTask(String value) {}

  void onPressedTask(int index, Client data) {
    //Fluttertoast.showToast(msg: data.label);
  }

  void onPressedAssignTask(int index, Client data) {}
  void onPressedMemberTask(int index, Client data) {}
  void onPressedCalendar() {}
  void onPressedTaskGroup(int index, Client data) {}

  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }

  @override
  void onInit() {

    TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

  }

  Future<void> scanTicket() async {

  }


  Future<void> searchDeparts() async {
    formKey.currentState!.save();

    var data = Map<String, dynamic>.from(formKey.currentState!.value);
    var _ville_depart = data['ville_depart']?? '0';
    var _ville_destination = data['ville_destination']?? '0';
    var _date_depart = data['date_depart']?? '0';

    ville_depart_id.value = int.parse(_ville_depart);
    ville_destination_id.value = int.parse(_ville_destination);
    date_depart.value = _date_depart.toString();

    Get.back();

    update();

  }


  //Charger la liste de tous les tickets
  Future fetchTickets(int evenementId) async {

    liste_tickets.value = List.empty();
    isLoadingTickets.value = true;

    try {
      String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

      String url = AppConstants.API_URL + "/vetements";

      final response = await http.get(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      print(url);

      if (response.statusCode == 200) {
        print(response.body);
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

        liste_tickets.value = parsed.map<Ticket>((json) => Ticket.fromJson(json)).toList();
        isLoadingTickets.value = false;

      } else {

        isLoadingTickets.value = false;

        print("response Body: " + response.body);

      }

    } finally {
      isLoadingTickets.value = false; // Set loading to false, whether successful or not
      throw Exception('Failed to load clothes');
    }

  }

  Future<void> verifTicket(String qr_code, evenement_id, BuildContext context) async {
    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE)
        .toString();

    print(TOKEN_STORAGE);

    isLoading.value = true;
    isVerified.value = false;

    String url = AppConstants.API_URL + "/verif_ticket";

    final response = await http.post(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    }, body: jsonEncode({'qrcode': qr_code, 'evenement_id': evenement_id}),);

    print(url);

    if (response.statusCode == 200) {

      isLoading.value = false;
      isVerified.value = true;
      SnackbarUi.success("TICKET CERTIFIE CONFORME.");
      Navigator.pop(context);
      fetchTickets(evenement_id);

    } else {

      isLoading.value = false;
      isVerified.value = false;
      SnackbarUi.error("TICKET INVALIDE.");

      print("response Body: " + response.body);

      throw Exception('Failed to load clients');

    }

  }

  Future<void> rechercherTicket() async {
    formKey.currentState!.save();

    var data = Map<String, dynamic>.from(formKey.currentState!.value);
    var _numero_ticket = data['numero_ticket']?? '';
    var _nom_acheteur = data['nom_acheteur']?? '';
    var _numero_telephone = data['numero_telephone']?? '';
    var _date_achat = data['date_achat']?? '';

    search_numero_ticket.value = _numero_ticket.toString();
    search_nom_acheteur.value = _nom_acheteur.toString();
    search_numero_telephone.value = _numero_telephone.toString();
    search_date_depart.value = _date_achat.toString();

    Get.back();

    update();

    //actualiser
    liste_tickets.value = liste_tickets.value.where((ticket) {
      bool matches = true;

      if (_numero_ticket.isNotEmpty) {
        matches = matches && ticket.ticketQrcode!.contains(_numero_ticket);
      }
      if (_nom_acheteur.isNotEmpty) {
        matches = matches && ticket.ticketQrcode!.contains(_nom_acheteur);
      }
      if (_numero_telephone.isNotEmpty) {
        matches = matches && ticket.ticketQrcode!.contains(_numero_telephone);
      }
      if (_date_achat == '') {
        matches = matches && ticket.ticketQrcode!.toString() == _date_achat;
      }

      return matches;
    }).toList();

  }

}
