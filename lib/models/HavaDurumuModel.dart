class WeatherModel {
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final String city;
  final String image;

  WeatherModel({
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.city,
    required this.image,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      image: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      city: json['name'].toString(),
    );
  }
}


class WeatherDay{
    final double temperature;
    final double avgTemp;
    final String image;
}