class UserModel {
  String? userid;
  String? email;
  String? nombres;
  String? apellidos;
  String? password;

  UserModel(
      {this.userid, this.email, this.nombres, this.apellidos, this.password});

  factory UserModel.fromMap(map) {
    return UserModel(
      userid: map['userid'],
      email: map['email'],
      nombres: map['nombres'],
      apellidos: map['apellidos'],
      password: map['password'],
    );
  }
  //enviar datos al servidor
  Map<String, dynamic> tomMap() {
    return {
      'userid': userid,
      'email': email,
      'nombres': nombres,
      'apellidos': apellidos,
      'password': password,
    };
  }
}
