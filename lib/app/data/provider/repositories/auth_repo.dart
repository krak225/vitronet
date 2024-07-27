import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/app_constants.dart';
import '../../services/dio_service.dart';
import '../responses/login_response.dart';

class AuthRepo {

  final DioService dioService;
  final GetStorage box = GetStorage();
  AuthRepo({required this.dioService});

  Future<Response> login({required dynamic data}) async {
    return await dioService.postData('/login', data: data);
  }

  Future<Response> refreshToken({required dynamic data}) async {
    return await dioService.postData('/token/refresh', data: data);
  }

  Future sessionTokenDataSave(LoginResponse loginResponse) async {

    box.write(AppConstants.TOKEN_STORAGE, loginResponse.accessToken);
    box.write(AppConstants.USER_STORAGE, loginResponse.user);
    box.write(AppConstants.USER_ID, loginResponse.user?.id);
    box.write(AppConstants.USER_FIRSTNAME, loginResponse.user?.prenoms);
    box.write(AppConstants.USER_LASTNAME, loginResponse.user?.nom);
    box.write(AppConstants.USER_EMAIL, loginResponse.user?.email);
    box.write(AppConstants.USER_ORGANISATEUR, loginResponse.organisateur?.organisateurNom);

    print(loginResponse.accessToken);

  }



}