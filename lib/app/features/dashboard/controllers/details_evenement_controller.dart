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

class DetailsEvenementController extends GetxController {
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


  @override
  void onInit() {

    TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

  }

}
