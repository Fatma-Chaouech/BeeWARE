

class Registration{
  String weight;


  Registration({
    required this.weight,

  }
      );
  factory Registration.fromJson(Map<String, dynamic> json) {
    return Registration(
        weight: json['weight'],

    );
  }
}