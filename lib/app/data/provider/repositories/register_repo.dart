import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_boarder/app/data/provider/responses/register_response.dart';

import '../../../config/app_constants.dart';
import '../../services/dio_service.dart';

class RegisterRepo {

  final DioService dioService;
  final GetStorage _storage = GetStorage();

  RegisterRepo({required this.dioService});

  Future<Response> register({required dynamic data}) async {
    Map<String, String> new_data = new Map();

    data.forEach((k,v) => {
      new_data[k] =  v
    });

    //ajout des éléement enregistré en session
    String document_data_cni = _storage.read(AppConstants.USER_CNI).toString();
    String document_data_dpc = _storage.read(AppConstants.USER_DPC).toString();
    String document_data_cv = _storage.read(AppConstants.USER_CV).toString();
    String document_data_att = _storage.read(AppConstants.USER_ATT).toString();
    String profil_id = _storage.read(AppConstants.USER_PROFIL_ID).toString();
    String situation_id = _storage.read(AppConstants.USER_SITUATION_ID).toString();

    new_data['profil_id'] = profil_id;
    new_data['situation_id'] = situation_id;
    new_data['user_cni'] = document_data_cni;
    new_data['user_dpc'] = document_data_dpc;
    new_data['user_cv'] = document_data_cv;
    new_data['user_att'] = document_data_att;

    return await dioService.postData('/register', data: new_data);

  }

  Future<Response> update_profile({required dynamic data}) async {
    return await dioService.postData('/update_profile', data: data);
  }

  Future sessionDataSave(RegisterResponse registerResponse) async {
    _storage.write(AppConstants.USER_ID, registerResponse.data?.id);
    _storage.write(AppConstants.USER_FIRSTNAME, registerResponse.data?.firstname);
    _storage.write(AppConstants.USER_LASTNAME, registerResponse.data?.lastname);
    _storage.write(AppConstants.USER_EMAIL, registerResponse.data?.email);
    print('@@@@@@@@@@@@@@@@@@RegisterResponse@@@@@@@@@@@');
    print(registerResponse.data?.firstname);
    print(registerResponse.data?.email);
  }


}
