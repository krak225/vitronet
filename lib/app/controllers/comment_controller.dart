
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

import '../config/app_constants.dart';
import '../data/models/offre.dart';
import '../data/provider/repositories/offre_repo.dart';

class CommentController extends GetxController {
      final RxBool isHide = false.obs;
      final OffreRepo offreRepo = Get.find();

      Future<List<Comment>> fetchComments() async {

        String url = AppConstants.API_URL + "/offres";
        print (url);
        final response = await http.get(Uri.parse(url), headers: {
          HttpHeaders.authorizationHeader: 'bearer token',
          HttpHeaders.contentTypeHeader: 'application/json',
        });

        if (response.statusCode == 200) {

          final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

          return parsed.map<Comment>((json) => Comment.fromMap(json)).toList();

        } else {

          throw Exception('Failed to load offres');
        }
      }

}