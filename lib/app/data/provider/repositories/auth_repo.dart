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

    box.write(AppConstants.USER_STATUT, loginResponse.statut);
    box.write(AppConstants.USER_FIRSTNAME, loginResponse.firstname);
    box.write(AppConstants.TOKEN_STORAGE, loginResponse.access);
    box.write(AppConstants.REFRESH_TOKEN_STORAGE, loginResponse.refresh);
    box.write(AppConstants.USER_FIRSTNAME, loginResponse.firstname);
    box.write(AppConstants.USER_LASTNAME, loginResponse.lastname);
    box.write(AppConstants.USER_ID, loginResponse.id);
    box.write(AppConstants.USER_EMAIL, loginResponse.email);
    box.write(AppConstants.USER_TELEPHONE, loginResponse.telephone);
    box.write(AppConstants.USER_ADRESSE, loginResponse.adresse);
    box.write(AppConstants.USER_GENRE, loginResponse.genre);
    box.write(AppConstants.USER_PHOTO, loginResponse.photo);
    box.write(AppConstants.USER_DOMAINE, loginResponse.domaine);
    box.write(AppConstants.USER_EXPERIENCE, loginResponse.experience);
    box.write(AppConstants.USER_OTP, loginResponse.otp);
    print('@@@@@@@@@@@@@@@@@@loginResponse@@@@@@@@@@@');
    print(loginResponse.email);

  }




}