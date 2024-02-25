// Modèle de cours
import 'package:klassrum_web/data/models/app_professer.dart';

class Course {
  final String code;
  final String intitule;
  final List<Professer> theirResponsables;
  final String image;

  Course(
      {required this.code,
      required this.intitule,
      required this.image,
      required this.theirResponsables});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      code: json['code'],
      intitule: json['intitule'],
      theirResponsables: json['theirResponsables'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'intitule': intitule,
      'theirResponsables': theirResponsables,
      'image': image,
    };
  }
}
