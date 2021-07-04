import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherData {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var country;
  var city;

  WeatherData(
      {this.temp, this.description, this.currently, this.humidity, this.windSpeed});

  Future getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Enugu&appid=9321cfe6398d21a98f121a007cbafb9c');
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    temp = data['main']['temp'];
    description = data['weather'][0]['description'];
    currently = data['weather'][0]['main'];
    humidity = data['main']['humidity'];
    windSpeed = data['wind']['speed'];
    country = data['sys']['country'];
    city = data['name'];
  }
}