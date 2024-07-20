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
import '../model/Ville.dart';
import '../model/client.dart';
import '../model/facture.dart';
import '../model/hellodepart_models.dart';
import '../model/produit.dart';

class HomeController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> formKey2 = GlobalKey<FormBuilderState>();

  GetStorage _storage = GetStorage();
  String TOKEN_STORAGE = "";

  final RxBool isLoading = false.obs;

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


  void fetchVilles() async {

    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();
    String url = AppConstants.API_URL + "/villes";

    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(url);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      villes = parsed.map<Ville>((json) => Ville.fromJson(json)).toList();

    }
  }


  Future<List<Depart>> fetchDeparts(int ville_depart_id, int ville_destination_id, String date_depart) async {

      String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

      String url = AppConstants.API_URL + "/rechercher_departs/" +
          ville_depart_id.toString() + "/" + ville_destination_id.toString() +
          "/" + date_depart.toString();

      final response = await http.get(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      print(url);

      if (response.statusCode == 200) {
        //print("responseBody: "+ response.body);

        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

        departs = parsed.map<Depart>((json) => Depart.fromJson(json)).toList();

        return departs;

      } else {
        print("response Body: " + response.body);

        throw Exception('Failed to load data');
      }

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

  Future<List<Facture>> fetchTickets() async {
    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

    String url = AppConstants.API_URL + "/factures";

    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(url);

    if (response.statusCode == 200) {
      print(response.body);
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      factures = parsed.map<Facture>((json) => Facture.fromJson(json)).toList();

      var today_0 = DateTime.now();
      var today_1 = DateTime.now().subtract(const Duration(days: 1));
      var today_2 = DateTime.now().subtract(const Duration(days: 2));
      var today_3 = DateTime.now().subtract(const Duration(days: 3));
      var today_4 = DateTime.now().subtract(const Duration(days: 4));

      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      String today_0_formated = dateFormat.format(today_0);
      String today_1_formated = dateFormat.format(today_1);
      String today_2_formated = dateFormat.format(today_2);
      String today_3_formated = dateFormat.format(today_3);
      String today_4_formated = dateFormat.format(today_4);

      var STAT_TODAY = Stdfn.sumTotalFactures(factures.where((facture) => facture.factureDateCreation!.contains(today_0_formated)));
      var STAT_TODAY_1 = Stdfn.sumTotalFactures(factures.where((facture) => facture.factureDateCreation!.contains(today_1_formated)));
      var STAT_TODAY_2 = Stdfn.sumTotalFactures(factures.where((facture) => facture.factureDateCreation!.contains(today_2_formated)));
      var STAT_TODAY_3 = Stdfn.sumTotalFactures(factures.where((facture) => facture.factureDateCreation!.contains(today_3_formated)));
      var STAT_TODAY_4 = Stdfn.sumTotalFactures(factures.where((facture) => facture.factureDateCreation!.contains(today_4_formated)));

      var MONTANT_TOTAL_COMMANDES = Stdfn.sumTotalFactures(factures);

      List<int> stats = [
        STAT_TODAY,
        STAT_TODAY_1,
        STAT_TODAY_2,
        STAT_TODAY_3,
        STAT_TODAY_4];

      int i = 0;
      for(var stat in taskInProgress){
        stat.label = Stdfn.toAmount(stats[i]).toString();
        stat.taux = (stats[i] * 100 / MONTANT_TOTAL_COMMANDES).toString();
        i++;
      }

      return factures;

    } else {

      print("response Body: " + response.body);

      throw Exception('Failed to load factures');

    }

  }

  Future<List<Client>> fetchClients() async {
    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE)
        .toString();

    print(TOKEN_STORAGE);

    String url = AppConstants.API_URL + "/clients";

    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(url);

    if (response.statusCode == 200) {

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      clients = parsed.map<Client>((json) => Client.fromMap(json)).toList();

      return clients;

    } else {

      print("response Body: " + response.body);

      throw Exception('Failed to load clients');

    }

  }

  Future<List<Produit>> fetchProduits() async {

    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE)
        .toString();

    print(TOKEN_STORAGE);

    String url = AppConstants.API_URL + "/produits";

    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(url);

    if (response.statusCode == 200) {

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      produits = parsed.map<Produit>((json) => Produit.fromJson(json)).toList();

      return produits;

    } else {

      print("response Body: " + response.body);

      throw Exception('Failed to load clients');

    }

  }


  @override
  void onInit() {

    TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

    taskInProgress.add(CardTaskData(
      label: STAT_TODAY.toString(),
      taux: "50",
      jobDesk: "Aujourd'hui",
      dueDate: DateTime.now().add(const Duration(hours: 0)),
    ));
    taskInProgress.add(CardTaskData(
      label: STAT_TODAY_1.toString(),
      taux: "30",
      jobDesk: "Hier",
      dueDate: DateTime.now().subtract(const Duration(days: 1)),
    ));
    taskInProgress.add(CardTaskData(
      label: STAT_TODAY_2.toString(),
      taux: "50",
      jobDesk: "Avant-hier",
      dueDate: DateTime.now().subtract(const Duration(days: 2)),
    ));
    taskInProgress.add(CardTaskData(
      label: STAT_TODAY_3.toString(),
      taux: "20",
      jobDesk: "Il y a 3 jours",
      dueDate: DateTime.now().subtract(const Duration(days: 3)),
    ));
    taskInProgress.add(CardTaskData(
      label: STAT_TODAY_4.toString(),
      taux: "60",
      jobDesk: "Il y a 4 jours",
      dueDate: DateTime.now().subtract(const Duration(days: 4)),
    ));

    //charger les données au lancement de l'application
    fetchTickets();
    fetchVilles();


  }

  Future<void> scanTicket() async {

  }


  Future<String> verifTicket(String qr_code) async {
    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE)
        .toString();

    print(TOKEN_STORAGE);

    String url = AppConstants.API_URL + "/verif_ticket";

    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(url);

    if (response.statusCode == 200) {

      return "Vérification OK";

    } else {

      print("response Body: " + response.body);

      throw Exception('Failed to load clients');

    }

  }

}
