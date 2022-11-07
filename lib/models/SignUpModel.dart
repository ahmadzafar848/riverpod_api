class SignUpModel {
  SignUpModel({
    this.email,
    this.password,
    this.displayName,
    this.loginBy,
  });

  SignUpModel.fromJson(dynamic json) {
    email = json['Email'];
    password = json['Password'];
    displayName = json['DisplayName'];
    loginBy = json['LoginBy'];
  }
  String? email;
  String? password;
  String? displayName;
  String? loginBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Email'] = email;
    map['Password'] = password;
    map['DisplayName'] = displayName;
    map['LoginBy'] = loginBy;
    return map;
  }
}
