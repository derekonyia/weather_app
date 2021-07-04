import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:weather_app/services.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var country;
  var city;

  Future getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Enugu&appid=9321cfe6398d21a98f121a007cbafb9c');
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    this.temp = data['main']['temp'];
    this.description = data['weather'][0]['description'];
    this.currently = data['weather'][0]['main'];
    this.humidity = data['main']['humidity'];
    this.windSpeed = data['wind']['speed'];
    this.country = data['sys']['country'];
    this.city = data['name'];
  }


  @override
  void initState() {
    super.initState();
    this.getData();

  }
  
  @override
  Widget build(BuildContext context) {
    print(country);
    return Scaffold(
      body:SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$country',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                  '$city',
                style: TextStyle(
                  fontSize: 15.0
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                'Weather information',
                style: TextStyle(
                    fontSize: 15.0
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wb_cloudy, size: 200.0,)
                ],
              ),
              // SizedBox(height: 5.0,),
              Text(
                '$temp\u00B0',
                style: TextStyle(
                    fontSize: 66.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '$description',
                style: TextStyle(
                    fontSize: 30.0,

                ),
              ),
              SizedBox(height: 100.0,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Column(
                      children: [
                        Text(
                          'Humidity',
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        ),
                        Text(
                          '$humidity',
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'wind',
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        ),
                        Text(
                          '$windSpeed 0km/hr',
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'temperature',
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        ),
                        Text(
                          '$temp\u00B0',
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ) ,
    );
  }
}

