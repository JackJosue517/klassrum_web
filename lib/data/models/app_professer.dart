// Modèle de cours
import 'package:klassrum_web/data/models/app_shedule_course.dart';

class Professer {
  final String nom;
  final String prenoms;
  final List<ShedulerCourse> theirCourse;
  final String photoProfil;
  final String identifier;
  final String password;

  Professer(
      {required this.prenoms,
      required this.nom,
      required this.identifier,
      required this.password,
      required this.photoProfil,
      required this.theirCourse});

  factory Professer.fromJson(Map<String, dynamic> json) {
    return Professer(
      prenoms: json['prenoms'],
      nom: json['nom'],
      identifier: json['identifier'],
      password: json['password'],
      theirCourse: json['theirCourse'],
      photoProfil: json['photoProfil'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prenoms': prenoms,
      'nom': nom,
      'identifier': identifier,
      'password': password,
      'theirCourse': theirCourse,
      'photoProfil': photoProfil,
    };
  }
}
