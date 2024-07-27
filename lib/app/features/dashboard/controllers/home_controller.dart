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

  Future<List<Ticket>> fetchTickets(int evenementId) async {
    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

    String url = AppConstants.API_URL + "/tickets/"+evenementId.toString();

    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(url);

    if (response.statusCode == 200) {
      print(response.body);
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      tickets = parsed.map<Ticket>((json) => Ticket.fromJson(json)).toList();

      return tickets;

    } else {

      print("response Body: " + response.body);

      throw Exception('Failed to load tickets');

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

  }

  Future<void> scanTicket() async {

  }


  Future<void> verifTicket(String qr_code) async {
    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE)
        .toString();

    print(TOKEN_STORAGE);

    isLoading.value = true;

    String url = AppConstants.API_URL + "/verif_ticket";

    final response = await http.post(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    }, body: jsonEncode({'qrcode': qr_code}),);

    print(url);

    if (response.statusCode == 200) {

      isLoading.value = false;
      SnackbarUi.success("TICKET CERTIFIE CONFORME.");

    } else {

      isLoading.value = false;
      SnackbarUi.error("TICKET INVALIDE.");

      print("response Body: " + response.body);

      throw Exception('Failed to load clients');

    }

  }


  //
  Future<void> verifTicketByNumero() async {

    print ("verifTicketByNumero");
    /*
    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      var data = Map<String, dynamic>.from(formKey.currentState!.value);

      var formData = dio.FormData.fromMap(data);
      print(formData);
      dio.Response response = await this.registerRepo.payerTicket(data: formData);

      if (response.statusCode == 200) {
        isLoading.value = false;

        //la facture a été enregistrée, procéder au paiement via cinetpay

        //SnackbarUi.success("Facture enregistrée avec succès");

        Get.to(AppPages.paiement);

      } else {
        print(response.data);

        SnackbarUi.error(response.data.toString());
        isLoading.value = false;
      }

      isLoading.value = false;

    } else {
      SnackbarUi.error("Veuillez saisir le numéro du ticket");
      isLoading.value = false;
    }*/

  }

}
