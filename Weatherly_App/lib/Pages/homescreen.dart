import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_new/Components/spacing.dart';
import 'package:weather_app_new/Pages/result.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchCity = TextEditingController();
    TextEditingController searchCountry = TextEditingController();
    TextEditingController searchState = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          VerticalSpacing(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weatherly',
                style: GoogleFonts.aBeeZee(
                    color: const Color(0xff37A043),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          VerticalSpacing(height: 10.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CountryStateCityPicker(
                  country: searchCountry,
                  state: searchState,
                  city: searchCity,
                  dialogColor: Colors.grey.shade200,
                  textFieldDecoration: InputDecoration(
                   fillColor: Colors.blueGrey.shade100,
                   filled: true,
                   suffixIcon: const Icon(Icons.arrow_drop_down_circle), 
                   border: const OutlineInputBorder(borderSide: BorderSide.none)))),
          VerticalSpacing(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: ResultScreen(cityName: searchCity.text),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color:Color(0xff37A043)
                ),
                child:const Center(child: Text('View Temperature',style: TextStyle(color: Colors.white,fontSize: 22),),),
              ),
            ),
          ),
          VerticalSpacing(height: 10.0),
          const Text('Search or Select from following'),
          VerticalSpacing(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: const ResultScreen(cityName: 'karachi'),
                );
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage('assets/karachi.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Karachi',
                      style: GoogleFonts.aBeeZee(
                          color: const Color.fromARGB(255, 214, 241, 218),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
          ),
          VerticalSpacing(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: const ResultScreen(cityName: 'islamabad'),
                );
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage('assets/islamabad.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Islamabad',
                      style: GoogleFonts.aBeeZee(
                          color: const Color.fromARGB(255, 214, 241, 218),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
          ),
          VerticalSpacing(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: const ResultScreen(cityName: 'lahore'),
                );
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage('assets/lahore.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Lahore',
                      style: GoogleFonts.aBeeZee(
                          color: const Color.fromARGB(255, 214, 241, 218),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
