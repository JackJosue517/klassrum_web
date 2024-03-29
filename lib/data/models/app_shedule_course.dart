class ShedulerCourse {
  String code;
  String intitule;
  String chapitre;
  String description;
  String enseignant;
  String status;
  String date;
  String heureFin;
  String heureDebut;
  int nombreEtudiants;

  ShedulerCourse(
      {required this.code,
      required this.intitule,
      required this.chapitre,
      required this.description,
      required this.enseignant,
      required this.date,
      required this.status,
      required this.heureDebut,
      required this.heureFin,
      required this.nombreEtudiants});

  factory ShedulerCourse.fromJson(Map<String, dynamic> json) {
    return ShedulerCourse(
        code: json['code'],
        intitule: json['intitule'],
        chapitre: json['chapitre'],
        description: json['description'],
        enseignant: json['enseignant'],
        date: json["date"],
        status: json['status'],
        heureDebut: json["heureDebut"],
        heureFin: json["heureFin"],
        nombreEtudiants: json['nombreEtudiants']);
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'intitule': intitule,
      'chapitre': chapitre,
      'description': description,
      'enseignant': enseignant,
      'date': date,
      'status': status,
      'heureDebut': heureDebut,
      'heureFin': heureFin,
      'nombreEtudiants': nombreEtudiants,
    };
  }
}
