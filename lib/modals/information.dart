

class Information{
  String weight;
  String temperature;
  String humidity;
  String frequency;


  Information({
    required this.weight,
    required this.temperature,
    required this.humidity,
    required this.frequency,

  }
      );
  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
      weight: json['weight'],
      temperature: json['temperature'],
      humidity: json['humidity'],
      frequency: json['frequency'],

    );
  }
}