import 'package:flutter/material.dart';
import 'package:getdata_withmodel_api/Models/api_model.dart';
import 'package:getdata_withmodel_api/Services/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommentData> dataNew = [];

  getData() {
    GetApiService().getData().then((value) {
      setState(() {
        dataNew = value!;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Get API Data With Model",
            style: GoogleFonts.abel(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: dataNew.length,
        itemBuilder: (context, index) {
          final apiData = dataNew[index];
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Card(
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Text(
                              apiData.id.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name: ',
                          style: GoogleFonts.abel(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.white60),
                        ),
                        Flexible(
                            child: Text(
                          apiData.name.toString(),
                          style: GoogleFonts.abel(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white60),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email: ',
                          style: GoogleFonts.abel(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.white60),
                        ),
                        Flexible(
                            child: Text(
                          apiData.email.toString(),
                          style: GoogleFonts.abel(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white60),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Body: ',
                          style: GoogleFonts.abel(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.white60),
                        ),
                        Flexible(
                            child: Text(
                          apiData.body.toString(),
                          style: GoogleFonts.abel(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white60),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
