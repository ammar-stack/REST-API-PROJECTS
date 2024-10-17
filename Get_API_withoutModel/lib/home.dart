import 'dart:developer';

import 'package:abs_restapi/services.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic postModelData = [];
  getPost(){
    ApiServices().getUserData().then((value){
      setState(() {
        postModelData = value;
      });
    }).onError((error,StackTrace){
      print(error);
    });
    }
    @override
  void initState() {
    getPost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Data Api Without Model"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: postModelData.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Card(
              color: Colors.yellowAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text('Name: ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text(postModelData[index]['name'].toString(),style:const TextStyle(fontSize: 20),),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Username: ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text(postModelData[index]['username'].toString(),style:const TextStyle(fontSize: 20),),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Email: ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text(postModelData[index]['email'].toString(),style:const TextStyle(fontSize: 20),),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('City: ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text(postModelData[index]['address']['city'].toString(),style:const TextStyle(fontSize: 20),),
                      ],
                    ),
                
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