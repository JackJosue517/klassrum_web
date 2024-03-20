// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String uid;
  final String username;
  final String lastname;
  final String firstname;
  final String email;
  final String pic;
  final String password;
  UserModel({
    required this.uid,
    required this.username,
    required this.lastname,
    required this.firstname,
    required this.email,
    required this.pic,
    required this.password,
  });

  UserModel copyWith({
    String? uid,
    String? username,
    String? lastname,
    String? firstname,
    String? email,
    String? pic,
    String? password,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      lastname: lastname ?? this.lastname,
      firstname: firstname ?? this.firstname,
      email: email ?? this.email,
      pic: pic ?? this.pic,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'username': username,
      'lastname': lastname,
      'firstname': firstname,
      'email': email,
      'pic': pic,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['_id'],
      username: map['username'],
      lastname: map['lastname'],
      firstname: map['firstname'],
      email: map['email'],
      pic: "assets/img/default_profil.jpg",
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, username: $username, lastname: $lastname, firstname: $firstname, email: $email, pic: $pic, password: $password)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.username == username &&
        other.lastname == lastname &&
        other.firstname == firstname &&
        other.email == email &&
        other.pic == pic &&
        other.password == password;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        username.hashCode ^
        lastname.hashCode ^
        firstname.hashCode ^
        email.hashCode ^
        pic.hashCode ^
        password.hashCode;
  }
}
