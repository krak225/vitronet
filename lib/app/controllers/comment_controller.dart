
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../config/app_constants.dart';
import '../data/models/offre.dart';
import '../data/provider/repositories/offre_repo.dart';

class CommentController extends GetxController {
      final RxBool isHide = false.obs;
      final OffreRepo offreRepo = Get.find();
      GetStorage _storage = GetStorage();
      late List<Comment> comments = List.empty();

      Future<List<Comment>> fetchComments(String type) async {

        String user_id = _storage.read(AppConstants.USER_ID).toString();
        String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

        String url = AppConstants.API_URL + "/offres/"+user_id +"/"+type;
        print (url);
        final response = await http.get(Uri.parse(url), headers: {
          HttpHeaders.authorizationHeader: 'bearer $TOKEN_STORAGE',
          HttpHeaders.contentTypeHeader: 'application/json',
        });

        if (response.statusCode == 200) {

          final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

          comments = parsed.map<Comment>((json) => Comment.fromMap(json)).toList();

          return comments;

        } else {

          throw Exception('Failed to load offres');
        }
      }

}