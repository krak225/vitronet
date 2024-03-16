
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../config/app_constants.dart';
import '../data/models/Diplome.dart';
import '../data/models/NiveauInstruction.dart';
import '../data/models/CategorieProfessionnelle.dart';
import '../data/models/LangueInternationale.dart';
import '../data/models/LangueLocale.dart';
import '../data/models/Metier.dart';
import '../data/models/Situation.dart';
import '../data/models/offre.dart';
import '../data/models/pays.dart';
import '../data/provider/repositories/auth_repo.dart';
import '../data/provider/repositories/register_repo.dart';
import '../data/provider/responses/login_response.dart';
import '../routes/app_routes.dart';
import '../ui/theme/snackbar_ui.dart';

class RegisterProfilController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final RxBool isHide = false.obs;
  final RxBool isHide2 = false.obs;
  final AuthRepo authRepo = Get.find();
  final RegisterRepo registerRepo = Get.find();
  final RxBool isLoading = false.obs;
  final GetStorage _storage = GetStorage();
  late List<Pays> pays = List.empty();
  late List<Metier> metiers = List.empty();
  late List<NiveauInstruction> niveaux_instructions = List.empty();
  late List<LangueInternationale> langues_internationales = List.empty();
  late List<LangueLocale> langues_locales = List.empty();
  late List<CategorieProfessionnelle> categories_professionnelles = List.empty();
  late List<Diplome> diplomes = List.empty();

  @override
  void onInit() {
    super.onInit();
    //fetchPays();
    initDataManuelement();
  }


  Future<void> register() async {
    //box.write('isLogin', true);

    formKey.currentState!.save();


    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      //SnackbarUi.info(formKey.currentState!.value);
      //print(formKey.currentState!.value);

      var data = Map<String, dynamic>.from(formKey.currentState!.value);

      String profil_id = '3';//_storage.read(AppConstants.USER_PROFIL_ID).toString();
      String situation_id = _storage.read(AppConstants.USER_SITUATION_ID).toString();
      String document_path_cni = _storage.read(AppConstants.USER_CNI).toString();
      //String document_path_dpc = _storage.read(AppConstants.USER_DPC).toString();
      //String document_path_cv = _storage.read(AppConstants.USER_CV).toString();
      //String document_path_att = _storage.read(AppConstants.USER_ATT).toString();

      data['profil_id'] = profil_id;
      data['situation_id'] = situation_id;

      if(document_path_cni != ''){
        data['cni'] = await dio.MultipartFile.fromFile(document_path_cni, filename: 'cni');
      }
      /*if(document_path_dpc != ''){
        //data['dpc'] = await dio.MultipartFile.fromFile(document_path_dpc, filename: 'dpc');
      }
      if(document_path_cv != ''){
        //data['cv'] = await dio.MultipartFile.fromFile(document_path_cv, filename: 'cv');
      }
      if(document_path_dpc != ''){
        //data['att'] = await dio.MultipartFile.fromFile(document_path_att, filename: 'att');
      }*/

      var formData = dio.FormData.fromMap(data);
      print("formData");
      print(formData);

      dio.Response response = await this.registerRepo.register(data: formData);

      print(response.data.toString());

      if (response.statusCode == 200) {

        //RegisterResponse registerResponse = RegisterResponse.fromJson(response.data);
        //this.registerRepo.sessionDataSave(registerResponse);user123

        //le connecter en même temps
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        this.authRepo.sessionTokenDataSave(loginResponse);
        //isLoading.value = true;
        SnackbarUi.success("Inscription effectué avec succès");

        //envoyer le token OTP
        //Get.offAllNamed(AppRoutes.REGISTER_OTP, arguments:loginResponse.email);
        //laisser otp
        Get.offAllNamed(AppRoutes.HOME);

      } else {
        SnackbarUi.error(response.data.toString());
        isLoading.value = false;
      }


    } else {
      SnackbarUi.error("Veuillez renseigner correctement le formulaire");
      isLoading.value = false;
    }
  }

  //Charger les données de la bd pour les listes déroulantes
  void fetchPays() async {

    print("_______________________");
    print("_______________________");

    String user_id = _storage.read(AppConstants.USER_ID).toString();
    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

    String url = AppConstants.API_URL + "/pays";
    print(url);

    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      pays = parsed.map<Pays>((json) => Pays.fromMap(json)).toList();

      print(pays);

      //return pays;
    } else {
      throw Exception('Failed to load pays');
    }

    print("_______________________");
    print("_______________________");

  }

  void initDataManuelement(){
    pays = [
      Pays(id: 1, nom: "Afghan", indicatif: 93),
      Pays(id: 2, nom: "Sud-Africain", indicatif: 27),
      Pays(id: 3, nom: "Albanais", indicatif: 355),
      Pays(id: 4, nom: "Algérien", indicatif: 213),
      Pays(id: 5, nom: "Allemand", indicatif: 49),
      Pays(id: 6, nom: "Andorran", indicatif: 376),
      Pays(id: 7, nom: "Angolais", indicatif: 244),
      Pays(id: 8, nom: "Antiguais, Barbudien", indicatif: 1268),
      Pays(id: 9, nom: "Saoudien", indicatif: 966),
      Pays(id: 10, nom: "Argentin", indicatif: 54),
      Pays(id: 11, nom: "Arménien", indicatif: 374),
      Pays(id: 12, nom: "Australien", indicatif: 61),
      Pays(id: 13, nom: "Autrichien", indicatif: 43),
      Pays(id: 14, nom: "Azéri", indicatif: 994),
      Pays(id: 15, nom: "Bahamien", indicatif: 1242),
      Pays(id: 16, nom: "Bahreïnien", indicatif: 973),
      Pays(id: 17, nom: "Bangladais", indicatif: 880),
      Pays(id: 18, nom: "Barbadien", indicatif: 1246),
      Pays(id: 19, nom: "Belge", indicatif: 32),
      Pays(id: 20, nom: "Bélizien", indicatif: 501),
      Pays(id: 21, nom: "Béninois", indicatif: 229),
      Pays(id: 22, nom: "Bhoutanais", indicatif: 975),
      Pays(id: 23, nom: "Biélorusse", indicatif: 375),
      Pays(id: 24, nom: "Birman", indicatif: 95),
      Pays(id: 25, nom: "Bolivien", indicatif: 591),
      Pays(id: 26, nom: "Bosnien", indicatif: 387),
      Pays(id: 27, nom: "Botswanais", indicatif: 267),
      Pays(id: 28, nom: "Brésilien", indicatif: 55),
      Pays(id: 29, nom: "Brunéien", indicatif: 673),
      Pays(id: 30, nom: "Bulgare", indicatif: 359),
      Pays(id: 31, nom: "Burkinabé", indicatif: 226),
      Pays(id: 32, nom: "Burundais", indicatif: 257),
      Pays(id: 33, nom: "Cambodgien", indicatif: 855),
      Pays(id: 34, nom: "Camerounais", indicatif: 237),
      Pays(id: 35, nom: "Canadien", indicatif: 1),
      Pays(id: 36, nom: "Cap-verdien", indicatif: 238),
      Pays(id: 37, nom: "Centrafricain", indicatif: 236),
      Pays(id: 38, nom: "Chilien", indicatif: 56),
      Pays(id: 39, nom: "Chinois", indicatif: 86),
      Pays(id: 40, nom: "Chypriote", indicatif: 357),
      Pays(id: 41, nom: "Colombien", indicatif: 57),
      Pays(id: 42, nom: "Comorien", indicatif: 269),
      Pays(id: 43, nom: "Congolais", indicatif: 242),
      Pays(id: 44, nom: "Congolais", indicatif: 243),
      Pays(id: 45, nom: "Nord-Coréen", indicatif: 850),
      Pays(id: 46, nom: "Sud-Coréen", indicatif: 82),
      Pays(id: 47, nom: "Costaricien", indicatif: 506),
      Pays(id: 48, nom: "Ivoirien", indicatif: 225),
      Pays(id: 49, nom: "Croate", indicatif: 385),
      Pays(id: 50, nom: "Cubain", indicatif: 53),
      Pays(id: 51, nom: "Danois", indicatif: 45),
      Pays(id: 52, nom: "Djiboutien", indicatif: 253),
      Pays(id: 53, nom: "Dominicain", indicatif: 1809),
      Pays(id: 54, nom: "Égyptien", indicatif: 20),
      Pays(id: 55, nom: "Émirien", indicatif: 971),
      Pays(id: 56, nom: "Équatorien", indicatif: 593),
      Pays(id: 57, nom: "Érythréen", indicatif: 291),
      Pays(id: 58, nom: "Espagnol", indicatif: 34),
      Pays(id: 59, nom: "Estonien", indicatif: 372),
      Pays(id: 60, nom: "Américain", indicatif: 1),
      Pays(id: 61, nom: "Éthiopien", indicatif: 251),
      Pays(id: 62, nom: "Fidjien", indicatif: 679),
      Pays(id: 63, nom: "Finlandais", indicatif: 358),
      Pays(id: 64, nom: "Français", indicatif: 33),
      Pays(id: 65, nom: "Gabonais", indicatif: 241),
      Pays(id: 66, nom: "Gambien", indicatif: 220),
      Pays(id: 67, nom: "Géorgien", indicatif: 500),
      Pays(id: 68, nom: "Ghanéen", indicatif: 233),
      Pays(id: 69, nom: "Grec", indicatif: 30),
      Pays(id: 70, nom: "Grenadien", indicatif: 1784),
      Pays(id: 71, nom: "Guatémaltèque", indicatif: 502),
      Pays(id: 72, nom: "Guinéen", indicatif: 224),
      Pays(id: 73, nom: "Bissao-guinéen", indicatif: 245),
      Pays(id: 74, nom: "Guyanais", indicatif: 592),
      Pays(id: 75, nom: "Haïtien", indicatif: 509),
      Pays(id: 77, nom: "Hondurien", indicatif: 504),
      Pays(id: 78, nom: "Hongrois", indicatif: 36),
      Pays(id: 79, nom: "Islandais", indicatif: 354),
      Pays(id: 80, nom: "Indien", indicatif: 91),
      Pays(id: 81, nom: "Indonésien", indicatif: 62),
      Pays(id: 82, nom: "Iranien", indicatif: 98),
      Pays(id: 83, nom: "Iraqien", indicatif: 964),
      Pays(id: 84, nom: "Irlandais", indicatif: 353),
      Pays(id: 85, nom: "Israélien", indicatif: 972),
      Pays(id: 86, nom: "Italien", indicatif: 39),
      Pays(id: 87, nom: "Jamaïcain", indicatif: 1876),
      Pays(id: 88, nom: "Japonais", indicatif: 81),
      Pays(id: 89, nom: "Jordanien", indicatif: 962),
      Pays(id: 90, nom: "Kazakhstani", indicatif: 997),
      Pays(id: 91, nom: "Kényan", indicatif: 254),
      Pays(id: 92, nom: "Kiribatien", indicatif: 686),
      Pays(id: 94, nom: "Koweïtien", indicatif: 965),
      Pays(id: 95, nom: "Kirghize", indicatif: 996),
      Pays(id: 96, nom: "Laotien", indicatif: 856),
      Pays(id: 97, nom: "Letton", indicatif: 371),
      Pays(id: 98, nom: "Libanais", indicatif: 961),
      Pays(id: 99, nom: "Libérien", indicatif: 231),
      Pays(id: 100, nom: "Libyen", indicatif: 218),
      Pays(id: 101, nom: "Liechtensteinois", indicatif: 423),
      Pays(id: 102, nom: "Lituanien", indicatif: 370),
      Pays(id: 103, nom: "Luxembourgeois", indicatif: 352),
      Pays(id: 104, nom: "Macédonien", indicatif: 389),
      Pays(id: 105, nom: "Malgache", indicatif: 261),
      Pays(id: 106, nom: "Malawien", indicatif: 265),
      Pays(id: 107, nom: "Malaisien", indicatif: 60),
      Pays(id: 108, nom: "Maldivien", indicatif: 960),
      Pays(id: 109, nom: "Maliens", indicatif: 223),
      Pays(id: 110, nom: "Maltais", indicatif: 356),
      Pays(id: 111, nom: "Marshallais", indicatif: 692),
      Pays(id: 112, nom: "Mauritanien", indicatif: 222),
      Pays(id: 113, nom: "Mauricien", indicatif: 230),
      Pays(id: 114, nom: "Mexicain", indicatif: 52),
      Pays(id: 115, nom: "Micronésien", indicatif: 691),
      Pays(id: 116, nom: "Moldave", indicatif: 373),
      Pays(id: 117, nom: "Monégasque", indicatif: 377),
      Pays(id: 118, nom: "Mongolien", indicatif: 976),
      Pays(id: 119, nom: "Monténégrin", indicatif: 382),
      Pays(id: 120, nom: "Marocain", indicatif: 212),
      Pays(id: 121, nom: "Mozambicain", indicatif: 258),
      Pays(id: 122, nom: "Namibien", indicatif: 264),
      Pays(id: 123, nom: "Nauruan", indicatif: 674),
      Pays(id: 124, nom: "Népalais", indicatif: 977),
      Pays(id: 125, nom: "Néo-Zélandais", indicatif: 64),
      Pays(id: 126, nom: "Nicaraguayen", indicatif: 505),
      Pays(id: 127, nom: "Nigérien", indicatif: 227),
      Pays(id: 128, nom: "Nigérian", indicatif: 234),
      Pays(id: 129, nom: "Nord-Coréen", indicatif: 850),
      Pays(id: 130, nom: "Norvégien", indicatif: 47),
      Pays(id: 131, nom: "Omanais", indicatif: 968),
      Pays(id: 132, nom: "Pakistanais", indicatif: 92),
      Pays(id: 133, nom: "Palauan", indicatif: 680),
      Pays(id: 134, nom: "Panaméen", indicatif: 507),
      Pays(id: 135, nom: "Papouan-Néo-Guinéen", indicatif: 675),
      Pays(id: 136, nom: "Paraguayen", indicatif: 595),
      Pays(id: 137, nom: "Péruvien", indicatif: 51),
      Pays(id: 138, nom: "Philippin", indicatif: 63),
      Pays(id: 139, nom: "Polonais", indicatif: 48),
      Pays(id: 140, nom: "Portugais", indicatif: 351),
      Pays(id: 141, nom: "Qatarien", indicatif: 974),
      Pays(id: 142, nom: "Roumain", indicatif: 40),
      Pays(id: 143, nom: "Russe", indicatif: 7),
      Pays(id: 144, nom: "Rwandais", indicatif: 250),
      Pays(id: 145, nom: "Kittitien-et-Névicien", indicatif: 1869),
      Pays(id: 146, nom: "Saint-Lucien", indicatif: 1758),
      Pays(id: 147, nom: "Saint-Marinais", indicatif: 378),
      Pays(id: 148, nom: "Salomonien", indicatif: 677),
      Pays(id: 149, nom: "Salvadorien", indicatif: 503),
      Pays(id: 150, nom: "Samoan", indicatif: 685),
      Pays(id: 152, nom: "Santoméen", indicatif: 239),
      Pays(id: 153, nom: "Saoudien", indicatif: 966),
      Pays(id: 154, nom: "Sénégalais", indicatif: 221),
      Pays(id: 155, nom: "Serbe", indicatif: 381),
      Pays(id: 156, nom: "Seychellois", indicatif: 248),
      Pays(id: 157, nom: "Sierra-Léonais", indicatif: 232),
      Pays(id: 158, nom: "Singapourien", indicatif: 65),
      Pays(id: 159, nom: "Slovaque", indicatif: 421),
      Pays(id: 160, nom: "Slovène", indicatif: 386),
      Pays(id: 161, nom: "Salomonien", indicatif: 677),
      Pays(id: 162, nom: "Somalien", indicatif: 252),
      Pays(id: 163, nom: "Sud-Africain", indicatif: 27),
      Pays(id: 164, nom: "Sud-Soudanais", indicatif: 211),
      Pays(id: 166, nom: "Espagnol", indicatif: 34),
      Pays(id: 167, nom: "Sri-Lankais", indicatif: 94),
      Pays(id: 168, nom: "Soudanais", indicatif: 249),
      Pays(id: 169, nom: "Surinamien", indicatif: 597),
      Pays(id: 170, nom: "Suédois", indicatif: 46),
      Pays(id: 171, nom: "Suisse", indicatif: 41),
      Pays(id: 172, nom: "Syrien", indicatif: 963),
      Pays(id: 173, nom: "Tadjikistanais", indicatif: 992),
      Pays(id: 174, nom: "Tanzanien", indicatif: 255),
      Pays(id: 175, nom: "Thaïlandais", indicatif: 66),
      Pays(id: 176, nom: "Timorais", indicatif: 670),
      Pays(id: 177, nom: "Togolais", indicatif: 228),
      Pays(id: 178, nom: "Tongien", indicatif: 676),
      Pays(id: 179, nom: "Trinidadien", indicatif: 1868),
      Pays(id: 180, nom: "Tunisien", indicatif: 216),
      Pays(id: 181, nom: "Turc", indicatif: 90),
      Pays(id: 182, nom: "Turkmène", indicatif: 993),
      Pays(id: 183, nom: "Tuvaluan", indicatif: 688),
      Pays(id: 184, nom: "Ougandais", indicatif: 256),
      Pays(id: 185, nom: "Ukrainien", indicatif: 380),
      Pays(id: 186, nom: "Émirien", indicatif: 971),
      Pays(id: 188, nom: "Uruguayen", indicatif: 598),
      Pays(id: 189, nom: "Ouzbek", indicatif: 998),
      Pays(id: 190, nom: "Vanuatuan", indicatif: 678),
      Pays(id: 191, nom: "Vénézuélien", indicatif: 58),
      Pays(id: 192, nom: "Vietnamien", indicatif: 84),
      Pays(id: 193, nom: "Yéménite", indicatif: 967),
      Pays(id: 194, nom: "Zambien", indicatif: 260),
      Pays(id: 195, nom: "Zimbabwéen", indicatif: 263),
      Pays(id: 243, nom: "Néerlandais", indicatif: 31),
      Pays(id: 244, nom: "Tchadien", indicatif: 235),
      Pays(id: 245, nom: "Seychellois", indicatif: 248),
      Pays(id: 246, nom: "Hélène", indicatif: 290),
      Pays(id: 247, nom: "Santoméen", indicatif: 239),
      Pays(id: 248, nom: "Sahraoui", indicatif: 212),
      Pays(id: 249, nom: "Réunionnais", indicatif: 262),
      Pays(id: 250, nom: "Mahorais", indicatif: 262),
      Pays(id: 251, nom: "Malgache", indicatif: 261),
      Pays(id: 252, nom: "Lesothan", indicatif: 266),
      Pays(id: 253, nom: "Equato-Guinéen", indicatif: 240),
      Pays(id: 255, nom: "Swazi", indicatif: 268),
      Pays(id: 256, nom: "Azerbaïdjanais", indicatif: 994),
    ];


    List<Map<String, dynamic>> metiersData = [
      {"metier_id": 15, "metier_libelle": "Comptabilité gestion", "metier_datecrea": "2023-03-11 22:38:01", "metier_statut": "VALIDE"},
      {"metier_id": 14, "metier_libelle": "Communication sociale", "metier_datecrea": "2023-03-11 22:38:01", "metier_statut": "VALIDE"},
      {"metier_id": 13, "metier_libelle": "Communication des Entreprises", "metier_datecrea": "2023-03-11 22:38:00", "metier_statut": "VALIDE"},
      {"metier_id": 12, "metier_libelle": "Commerce International", "metier_datecrea": "2023-03-11 22:37:59", "metier_statut": "VALIDE"},
      {"metier_id": 11, "metier_libelle": "Bureautique", "metier_datecrea": "2023-03-11 22:37:59", "metier_statut": "VALIDE"},
      {"metier_id": 10, "metier_libelle": "Biotechnologie", "metier_datecrea": "2023-03-11 22:37:58", "metier_statut": "VALIDE"},
      {"metier_id": 9, "metier_libelle": "Bâtiment Travaux Publics", "metier_datecrea": "2023-03-11 22:37:57", "metier_statut": "VALIDE"},
      {"metier_id": 8, "metier_libelle": "Assurance", "metier_datecrea": "2023-03-11 22:37:56", "metier_statut": "VALIDE"},
      {"metier_id": 7, "metier_libelle": "Assistance Sociale", "metier_datecrea": "2023-03-11 22:37:56", "metier_statut": "VALIDE"},
      {"metier_id": 6, "metier_libelle": "Animation rurale", "metier_datecrea": "2023-03-11 22:32:42", "metier_statut": "VALIDE"},
      {"metier_id": 5, "metier_libelle": "Analyste programmeur", "metier_datecrea": "2023-03-11 22:32:29", "metier_statut": "VALIDE"},
      {"metier_id": 4, "metier_libelle": "Alphabétisation", "metier_datecrea": "2023-03-11 22:32:14", "metier_statut": "VALIDE"},
      {"metier_id": 3, "metier_libelle": "Agronomie", "metier_datecrea": "2023-03-11 22:32:01", "metier_statut": "VALIDE"},
      {"metier_id": 2, "metier_libelle": "Agriculture", "metier_datecrea": "2023-03-11 22:31:49", "metier_statut": "VALIDE"},
      {"metier_id": 1, "metier_libelle": "Action sociale", "metier_datecrea": "2023-03-11 22:31:32", "metier_statut": "VALIDE"},
      {"metier_id": 16, "metier_libelle": "Comptabilité informatique", "metier_datecrea": "2023-03-11 22:38:02", "metier_statut": "VALIDE"},
      {"metier_id": 17, "metier_libelle": "Construction métallique", "metier_datecrea": "2023-03-11 22:38:03", "metier_statut": "VALIDE"},
      {"metier_id": 18, "metier_libelle": "Contrôle de prix/Transit douane", "metier_datecrea": "2023-03-11 22:38:03", "metier_statut": "VALIDE"},
      {"metier_id": 19, "metier_libelle": "Domaine", "metier_datecrea": "2023-03-11 22:38:04", "metier_statut": "VALIDE"},
      {"metier_id": 20, "metier_libelle": "Economie des entreprises", "metier_datecrea": "2023-03-11 22:38:04", "metier_statut": "VALIDE"},
      {"metier_id": 21, "metier_libelle": "Economie générale", "metier_datecrea": "2023-03-11 22:38:05", "metier_statut": "VALIDE"},
      {"metier_id": 22, "metier_libelle": "Economie pétrolière", "metier_datecrea": "2023-03-11 22:38:06", "metier_statut": "VALIDE"},
      {"metier_id": 23, "metier_libelle": "Energétique", "metier_datecrea": "2023-03-11 22:38:07", "metier_statut": "VALIDE"},
      {"metier_id": 24, "metier_libelle": "Environnement", "metier_datecrea": "2023-03-11 22:38:08", "metier_statut": "VALIDE"},
      {"metier_id": 25, "metier_libelle": "Epidémiologie / Biologie", "metier_datecrea": "2023-03-11 22:38:08", "metier_statut": "VALIDE"},
      {"metier_id": 26, "metier_libelle": "Epidémiologie / Biostatistique", "metier_datecrea": "2023-03-11 22:38:09", "metier_statut": "VALIDE"},
      {"metier_id": 27, "metier_libelle": "Finance Banque", "metier_datecrea": "2023-03-11 22:38:10", "metier_statut": "VALIDE"},
      {"metier_id": 28, "metier_libelle": "Finance Trésor", "metier_datecrea": "2023-03-11 22:38:10", "metier_statut": "VALIDE"},
      {"metier_id": 29, "metier_libelle": "Fiscalité et domaine", "metier_datecrea": "2023-03-11 22:38:11", "metier_statut": "VALIDE"},
      {"metier_id": 30, "metier_libelle": "Forêt et Faunes", "metier_datecrea": "2023-03-11 22:38:11", "metier_statut": "VALIDE"},
      {"metier_id": 31, "metier_libelle": "Génie électrique", "metier_datecrea": "2023-03-11 22:40:26", "metier_statut": "VALIDE"},
      {"metier_id": 32, "metier_libelle": "Génie mécanique", "metier_datecrea": "2023-03-11 22:40:26", "metier_statut": "VALIDE"},
      {"metier_id": 33, "metier_libelle": "Génie Rural", "metier_datecrea": "2023-03-11 22:40:27", "metier_statut": "VALIDE"},
      {"metier_id": 34, "metier_libelle": "Géologie/Mine", "metier_datecrea": "2023-03-11 22:40:28", "metier_statut": "VALIDE"},
      {"metier_id": 35, "metier_libelle": "Gestion", "metier_datecrea": "2023-03-11 22:40:28", "metier_statut": "VALIDE"},
      {"metier_id": 36, "metier_libelle": "Gestion Commerciale", "metier_datecrea": "2023-03-11 22:40:29", "metier_statut": "VALIDE"},
      {"metier_id": 37, "metier_libelle": "Gestion et Administration des Entreprises", "metier_datecrea": "2023-03-11 22:40:30", "metier_statut": "VALIDE"},
      {"metier_id": 38, "metier_libelle": "GRH et Communication", "metier_datecrea": "2023-03-11 22:40:31", "metier_statut": "VALIDE"},
      {"metier_id": 39, "metier_libelle": "Histoire", "metier_datecrea": "2023-03-11 22:40:32", "metier_statut": "VALIDE"},
      {"metier_id": 40, "metier_libelle": "Infirmier", "metier_datecrea": "2023-03-11 22:40:32", "metier_statut": "VALIDE"},
      {"metier_id": 41, "metier_libelle": "Informatique", "metier_datecrea": "2023-03-11 22:43:14", "metier_statut": "VALIDE"},
      {"metier_id": 42, "metier_libelle": "Informatique de gestion", "metier_datecrea": "2023-03-11 22:43:15", "metier_statut": "VALIDE"},
      {"metier_id": 43, "metier_libelle": "Laboratoire", "metier_datecrea": "2023-03-11 22:43:15", "metier_statut": "VALIDE"},
      {"metier_id": 44, "metier_libelle": "Maçonnerie", "metier_datecrea": "2023-03-11 22:43:16", "metier_statut": "VALIDE"},
      {"metier_id": 45, "metier_libelle": "Maintenance", "metier_datecrea": "2023-03-11 22:43:17", "metier_statut": "VALIDE"},
      {"metier_id": 46, "metier_libelle": "Maintenance Bio médicale et hospitalière", "metier_datecrea": "2023-03-11 22:43:17", "metier_statut": "VALIDE"},
      {"metier_id": 47, "metier_libelle": "Maintenance informatique", "metier_datecrea": "2023-03-11 22:43:18", "metier_statut": "VALIDE"},
      {"metier_id": 48, "metier_libelle": "Mécanique", "metier_datecrea": "2023-03-11 22:43:19", "metier_statut": "VALIDE"},
      {"metier_id": 49, "metier_libelle": "Mécanique Industrielle", "metier_datecrea": "2023-03-11 22:43:19", "metier_statut": "BROUILLON"},
      {"metier_id": 51, "metier_libelle": "Autres", "metier_datecrea": "2023-06-05 00:07:16", "metier_statut": "VALIDE"},
    ];

    // Convertir les données JSON en objets CategorieProfessionnelle
    metiers = metiersData.map((metiersData) => Metier.fromJson(metiersData)).toList();


    List<Map<String, dynamic>> data = [
      {"catepro_id":1,"catepro_lib":"Agents de Maitrise","catepro_datecrea":"2023-03-11 21:36:51","catepro_statut":"VALIDE"},
      {"catepro_id":2,"catepro_lib":"Apprentis","catepro_datecrea":"2023-03-11 21:36:51","catepro_statut":"VALIDE"},
      {"catepro_id":3,"catepro_lib":"Employés de bureau","catepro_datecrea":"2023-03-11 21:36:52","catepro_statut":"VALIDE"},
      {"catepro_id":4,"catepro_lib":"Ingénieurs et Cadres Supérieurs","catepro_datecrea":"2023-03-11 21:36:53","catepro_statut":"VALIDE"},
      {"catepro_id":5,"catepro_lib":"Manœuvres","catepro_datecrea":"2023-03-11 21:36:53","catepro_statut":null},
      {"catepro_id":6,"catepro_lib":"Ouvriers Qualifiés","catepro_datecrea":"2023-03-11 21:36:54","catepro_statut":null},
      {"catepro_id":7,"catepro_lib":"Ouvriers Spécialisés","catepro_datecrea":"2023-03-11 21:36:55","catepro_statut":null}
    ];

    // Convertir les données JSON en objets CategorieProfessionnelle
    categories_professionnelles = data.map((json) => CategorieProfessionnelle.fromJson(json)).toList();

    List<Map<String, dynamic>> niveauxData = [
      {"niveau_id":1,"niveau_lib":"3i\u00e8me cycle Universitaire","niveau_datecrea":"2023-03-11 22:19:36","niveauinstruction_statut":"VALIDE"},
      {"niveau_id":2,"niveau_lib":"2i\u00e8me cycle Universitaire","niveau_datecrea":"2023-03-11 22:19:37","niveauinstruction_statut":"VALIDE"},
      {"niveau_id":3,"niveau_lib":"1er cycle Universitaire","niveau_datecrea":"2023-03-11 22:19:37","niveauinstruction_statut":"VALIDE"},
      {"niveau_id":4,"niveau_lib":"Enseigt.Tech.Prof.Sup\u00e9rieur","niveau_datecrea":"2023-03-11 22:19:38","niveauinstruction_statut":"VALIDE"},
      {"niveau_id":5,"niveau_lib":"Enseigt.Tech.Prof.Moyen","niveau_datecrea":"2023-03-11 22:19:39","niveauinstruction_statut":"VALIDE"},
      {"niveau_id":6,"niveau_lib":"Secondaire 2i\u00e8me cycle","niveau_datecrea":"2023-03-11 22:19:39","niveauinstruction_statut":"VALIDE"},
      {"niveau_id":7,"niveau_lib":"Secondaire 1er cycle","niveau_datecrea":"2023-03-11 22:19:40","niveauinstruction_statut":"VALIDE"},
      {"niveau_id":8,"niveau_lib":"Primaire","niveau_datecrea":"2023-03-11 22:19:41","niveauinstruction_statut":"VALIDE"},
      {"niveau_id":9,"niveau_lib":"Non Instruits","niveau_datecrea":"2023-03-11 22:19:41","niveauinstruction_statut":"VALIDE"}
    ];

    niveaux_instructions = niveauxData.map((json) => NiveauInstruction.fromJson(json)).toList();


    List<Map<String, dynamic>> situationsData = [
      {"situation_id":1,"situation_lib":"Chômeurs","situation_datecrea":"2023-03-11 21:41:11","situation_statut":"VALIDE"},
      {"situation_id":2,"situation_lib":"En activité","situation_datecrea":"2023-03-11 21:41:12","situation_statut":"VALIDE"},
      // Ajoutez le reste des données ici
    ];

    List<Situation> situations = situationsData.map((json) => Situation.fromJson(json)).toList();

    List<Map<String, dynamic>> languesInternationalesData = [
      {
        "langueinter_id": 1,
        "langueinter_lib": "Français",
        "langueinter_datecrea": "2023-03-11 22:52:09",
        "langueinter_statut": "VALIDE"
      },
      {
        "langueinter_id": 2,
        "langueinter_lib": "Espagnole",
        "langueinter_datecrea": "2023-03-11 22:52:10",
        "langueinter_statut": "VALIDE"
      },
      {
        "langueinter_id": 3,
        "langueinter_lib": "Arabe",
        "langueinter_datecrea": "2023-03-11 22:52:10",
        "langueinter_statut": "VALIDE"
      },
      {
        "langueinter_id": 4,
        "langueinter_lib": "Allemand",
        "langueinter_datecrea": "2023-03-11 22:52:11",
        "langueinter_statut": "VALIDE"
      },
      {
        "langueinter_id": 5,
        "langueinter_lib": "Français-Anglais",
        "langueinter_datecrea": "2023-03-11 22:52:12",
        "langueinter_statut": "VALIDE"
      },
      {
        "langueinter_id": 6,
        "langueinter_lib": "Français-Arabe",
        "langueinter_datecrea": "2023-03-11 22:52:12",
        "langueinter_statut": "VALIDE"
      },
      {
        "langueinter_id": 7,
        "langueinter_lib": "Français-Allemand",
        "langueinter_datecrea": "2023-03-11 22:52:13",
        "langueinter_statut": "VALIDE"
      },
      {
        "langueinter_id": 8,
        "langueinter_lib": "Français-Anglais-Arabe",
        "langueinter_datecrea": "2023-03-11 22:52:14",
        "langueinter_statut": "VALIDE"
      },
      {
        "langueinter_id": 9,
        "langueinter_lib": "Français-Anglais-Espagnole",
        "langueinter_datecrea": "2023-03-11 22:52:14",
        "langueinter_statut": "VALIDE"
      },
      {
        "langueinter_id": 10,
        "langueinter_lib": "Français-Anglais-Allemand",
        "langueinter_datecrea": "2023-03-11 22:52:15",
        "langueinter_statut": "VALIDE"
      },
      {
        "langueinter_id": 11,
        "langueinter_lib": "Français-Alleamand-Arabe",
        "langueinter_datecrea": "2023-03-11 22:52:16",
        "langueinter_statut": "VALIDE"
      },
      {
        "langueinter_id": 12,
        "langueinter_lib": "Français-Espagnole-Arabe",
        "langueinter_datecrea": "2023-03-11 22:52:16",
        "langueinter_statut": "BROUILLON"
      },
      {
        "langueinter_id": 13,
        "langueinter_lib": "Autres",
        "langueinter_datecrea": "2023-03-11 22:52:17",
        "langueinter_statut": "VALIDE"
      }
    ];

    langues_internationales = languesInternationalesData.map((json) => LangueInternationale.fromJson(json)).toList();


    List<Map<String, dynamic>> languesLocalesData = [
      {
        "languelocal_id": 1,
        "languelocal_lib": "Haoussa",
        "languelocal_datecrea": "2023-03-11 22:56:29",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 2,
        "languelocal_lib": "Kanouri",
        "languelocal_datecrea": "2023-03-11 22:56:30",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 3,
        "languelocal_lib": "Toubou",
        "languelocal_datecrea": "2023-03-11 22:56:30",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 4,
        "languelocal_lib": "Zerma",
        "languelocal_datecrea": "2023-03-11 22:56:31",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 5,
        "languelocal_lib": "Fulfuld\u00e9",
        "languelocal_datecrea": "2023-03-11 22:56:31",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 6,
        "languelocal_lib": "Tamach\u00e8que",
        "languelocal_datecrea": "2023-03-11 22:56:32",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 7,
        "languelocal_lib": "Haoussa-Zerma",
        "languelocal_datecrea": "2023-03-11 22:56:33",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 8,
        "languelocal_lib": "Haoussa-Kanouri",
        "languelocal_datecrea": "2023-03-11 22:56:33",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 9,
        "languelocal_lib": "Haoussa-Fulfuld\u00e9",
        "languelocal_datecrea": "2023-03-11 22:56:35",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 11,
        "languelocal_lib": "Haoussa-Zerma-Fulfuld\u00e9",
        "languelocal_datecrea": "2023-03-11 22:56:36",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 12,
        "languelocal_lib": "Haoussa-Zerma-Fulfuld\u00e9-Tamach\u00e8que",
        "languelocal_datecrea": "2023-03-11 22:56:37",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 13,
        "languelocal_lib": "Haoussa-Zerma-Kanouri",
        "languelocal_datecrea": "2023-03-11 22:56:37",
        "languelocal_statut": "VALIDE"
      },
      {
        "languelocal_id": 14,
        "languelocal_lib": "Haoussa-Zerma-Toubou",
        "languelocal_datecrea": "2023-03-11 22:56:38",
        "languelocal_statut": "BROUILLON"
      },
      {
        "languelocal_id": 15,
        "languelocal_lib": "Autres",
        "languelocal_datecrea": "2023-05-28 21:23:31",
        "languelocal_statut": "VALIDE"
      }
    ];

    langues_locales = languesLocalesData.map((json) => LangueLocale.fromJson(json)).toList();


    List<Map<String, dynamic>> diplomesData = [
      {
        "diplome_id": 1,
        "diplomelib": "BAC",
        "diplome_datecrea": "2023-03-11 22:56:29",
        "diplome_statut": "VALIDE"
      },
    ];

    //diplomes = diplomesData.map((json) => Diplome.fromJson(json)).toList();

    diplomes = [
      Diplome(
        diplomeId: 1,
        diplomelib: "SANS DIPLOMES",
        diplomeDatecrea: "2022-12-31 18:15:53",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 2,
        diplomelib: "CFEPD",
        diplomeDatecrea: "2022-12-31 18:16:19",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 3,
        diplomelib: "BEPC",
        diplomeDatecrea: "2023-01-03 14:34:40",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 4,
        diplomelib: "BAC",
        diplomeDatecrea: "2023-01-03 14:35:13",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 5,
        diplomelib: "BAC+1",
        diplomeDatecrea: "2023-02-07 18:53:36",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 6,
        diplomelib: "DUEL/DEUG/DUES:BAC+2",
        diplomeDatecrea: "2023-02-07 20:08:16",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 7,
        diplomelib: "Licence:BAC+3",
        diplomeDatecrea: "2023-02-07 20:08:19",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 8,
        diplomelib: "Master BAC+5",
        diplomeDatecrea: "2023-03-11 22:22:53",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 9,
        diplomelib: "MAITRISE:BAC+ 4",
        diplomeDatecrea: "2023-03-11 22:22:54",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 10,
        diplomelib: "DESS",
        diplomeDatecrea: "2023-03-11 22:23:08",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 11,
        diplomelib: "DEA",
        diplomeDatecrea: "2023-03-11 22:23:22",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 12,
        diplomelib: "INGENIEUR",
        diplomeDatecrea: "2023-03-11 22:23:36",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 13,
        diplomelib: "DOCTORAT",
        diplomeDatecrea: "2023-03-11 22:23:48",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 14,
        diplomelib: "CQP",
        diplomeDatecrea: "2023-03-11 22:24:09",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 15,
        diplomelib: "CAP",
        diplomeDatecrea: "2023-03-11 22:24:15",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 16,
        diplomelib: "BEP",
        diplomeDatecrea: "2023-03-11 22:24:27",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 17,
        diplomelib: "BAP",
        diplomeDatecrea: "2023-03-11 22:24:38",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 18,
        diplomelib: "BFP",
        diplomeDatecrea: "2023-03-11 22:26:48",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 19,
        diplomelib: "DAP",
        diplomeDatecrea: "2023-03-11 22:26:49",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 20,
        diplomelib: "BAC pro/tech",
        diplomeDatecrea: "2023-03-11 22:26:49",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 21,
        diplomelib: "BTS",
        diplomeDatecrea: "2023-03-11 22:26:50",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 22,
        diplomelib: "DUT",
        diplomeDatecrea: "2023-03-11 22:26:51",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 23,
        diplomelib: "DUTS",
        diplomeDatecrea: "2023-03-11 22:26:51",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 24,
        diplomelib: "DTS",
        diplomeDatecrea: "2023-03-11 22:26:52",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 25,
        diplomelib: "LICENCE PRO",
        diplomeDatecrea: "2023-03-11 22:26:54",
        diplomeStatut: "VALIDE",
      ),
      Diplome(
        diplomeId: 26,
        diplomelib: "MASTER PRO",
        diplomeDatecrea: "2023-03-11 22:26:53",
        diplomeStatut: "BROUILLON",
      ),
      Diplome(
        diplomeId: 27,
        diplomelib: "AUTRES",
        diplomeDatecrea: "2023-03-11 22:26:55",
        diplomeStatut: "VALIDE",
      ),
    ];

  }

}