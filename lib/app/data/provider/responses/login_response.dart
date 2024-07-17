import '../../../features/dashboard/model/facture.dart';

class LoginResponse {
  String? accessToken;
  String? tokenType;
  User? user;

  LoginResponse({this.accessToken, this.tokenType, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    final user = this.user;
    if (user != null) {
      data['user'] = user.toJson();
    }
    return data;
  }
}