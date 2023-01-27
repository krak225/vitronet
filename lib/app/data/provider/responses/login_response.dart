class LoginResponse {
  String? refresh, access, id, firstname, lastname, email, telephone, adresse, genre;


  LoginResponse({this.refresh, this.access, this.id, this.firstname, this.lastname, this.email, this.telephone, this.adresse, this.genre});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    telephone = json['telephone'];
    adresse = json['adresse'];
    genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['adresse'] = this.adresse;
    data['genre'] = this.genre;
    return data;
  }
}