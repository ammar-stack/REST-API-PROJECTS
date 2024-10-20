import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_new/Components/spacing.dart';
import 'package:weather_app_new/Models/getdata_model.dart';

class ResultScreen extends StatefulWidget {
  final String? cityName;
  ResultScreen({super.key, this.cityName});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<GetdataModel> getData(String cityName) async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=9349e78ef9c1237a24f58799ab3c7067&units=metric'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      double tempCelcius = (data['main']['temp'] as num).toDouble();
      String cityNAME = data['name'];
      String weatherType = data['weather'][0]['description'];
      int humidity = data['main']['humidity'];
      int pressure = data['main']['pressure'];
      double windSpeed = (data['wind']['speed'] as num).toDouble();

      return GetdataModel(
          cityName: cityNAME,
          temperature: tempCelcius,
          weatherType: weatherType,
          humidity: humidity.toString(),
          presure: pressure.toString(),
          windSpeed: windSpeed.toString());
    } else {
      throw Exception('Failed to load weather data corretly');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve cityName from arguments
    final args = ModalRoute.of(context)?.settings.arguments as ResultScreen;
    final String cityName = args.cityName ?? 'Unknown city';

    return Scaffold(
        
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/back.jpg'),fit: BoxFit.cover)
          ),
          child: FutureBuilder<GetdataModel>(
              future: getData(cityName),
              builder: (context, Snapshot) {
                if (Snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff37A043),
                      strokeWidth: 4.0,
                    ),
                  );
                } else if (Snapshot.hasData) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Snapshot.data!.cityName,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 55, fontWeight: FontWeight.bold,color:const Color(0xff37A043)),
                        ),
                        Text(
                          '${Snapshot.data!.temperature.toString()} •C',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 90, fontWeight: FontWeight.bold,color:Colors.black),
                        ),
                        Text(
                          Snapshot.data!.weatherType,
                          style: GoogleFonts.arima(
                              fontSize: 40, fontWeight: FontWeight.bold,color:Colors.black)),
                        VerticalSpacing(height: 50.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset('assets/humidity.svg',height: 70,width: 70,),
                                Text("Humidity",style: GoogleFonts.aBeeZee(
                            fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black)),
                                Text(Snapshot.data!.humidity,style:const TextStyle(fontSize: 25),)
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset('assets/pressure.svg',height: 70,width: 70,),
                                Text("Pressure",style: GoogleFonts.aBeeZee(
                            fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black)),
                                Text(Snapshot.data!.presure,style:const TextStyle(fontSize: 25),)
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset('assets/wind.svg',height: 70,width: 70,),
                                Text("Wind Speed",style: GoogleFonts.aBeeZee(
                            fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black)),
                                Text(Snapshot.data!.windSpeed,style:const TextStyle(fontSize: 25),)
                              ],
                            )
                          ],
                        ),
                        VerticalSpacing(height: 40.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 140),
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,width: double.infinity,
                              decoration:const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: Color(0xff37A043)),
                            child: const Center(child: Text("Retry",style: TextStyle(color: Colors.white,fontSize: 22),)),
                            ),
                          ),
                        )
          
                        
                      ],
                    ),
                  );
                } else if (Snapshot.hasError) {
                  return Center(child: Text(Snapshot.error.toString()));
                } else {
                  return const Center(
                    child: Text("No data available."),
                  );
                }
              }),
        ));
  }
}
