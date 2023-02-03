import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:job_boarder/app/Model/fact_model.dart';

import '../config/app_constants.dart';
import '../data/models/offre.dart';

class RechercheController extends GetxController {
  var factModels = [].obs;
  GetStorage _storage = GetStorage();

  Future<RxList?> getOffres(String search) async {
    factModels.clear();

    String user_id = _storage.read(AppConstants.USER_ID).toString();
    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE)
        .toString();

    String url = AppConstants.API_URL + "/offres/" + user_id + "/2";
    print(url);
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

      print("Error");

      return null;
    }



  }

  Future<RxList?> getFact_(String num) async {

    var headers = {'X-Api-Key': 'MIDFz+x87i4IWQc8vh6BLA==LvD9ZTs69p7dSrKi'};

    String baseUrl = 'https://api.api-ninjas.com/v1/facts?limit=$num';
    final response = await http.Client().get(Uri.parse(baseUrl), headers: headers);

    if (response.statusCode == 200) {
      Iterable results = jsonDecode(response.body);
      for (var result in results) {
        var factModel = FactModel.fromJson(result);
        factModels.add(factModel);
      }
      print(factModels.toString());
      return factModels;
    } else {
      print("ERROR"+num);
      return null;
    }

    print("loaded");

  }

  RxList get FactRepo => factModels;


}
