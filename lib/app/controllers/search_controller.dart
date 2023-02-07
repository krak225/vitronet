
import 'dart:io';

import 'package:get/get.dart';

import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../config/app_constants.dart';
import '../data/models/offre.dart';

class SearchController extends GetxController {
  var factModels = [].obs;
  GetStorage _storage = GetStorage();

  Future<RxList?> getOffres(String search) async {
    factModels.clear();

    String user_id = _storage.read(AppConstants.USER_ID).toString();
    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE)
        .toString();

    String url = AppConstants.API_URL + "/offres_all/";

    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Comment> comments = parsed.map<Comment>((json) =>
          Comment.fromMap(json)).toList();

      factModels.addAll(search != ""? comments.where((comment) => comment.offretitre.toLowerCase().contains(search.toLowerCase().trim())) : comments);

      return factModels;

    } else {

      print("search error" + response.body);

      return null;
    }


  }


  RxList get FactRepo => factModels;


}