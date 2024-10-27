import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:start_post_api/dio_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  Cart? cart;

  Future<void> getData() async{
     String URL = 'https://dummyjson.com/carts';
     try{
      var response = await Dio().get(URL);
      if(response.data != null){
        setState(() {
          cart = Cart.fromJson(response.data);
        });
      }
      else{
        throw Exception("API response is null or in an unexpected format");
      }
     }
     catch(e){print(e.toString());}
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Fetch data with dio package"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: cart == null ? const Center(child: CircularProgressIndicator()):
      GridView.builder(
        itemCount: cart!.carts!.length,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12), 
        itemBuilder: (context,index){
          return Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(cart!.carts![index].products![1].thumbnail ?? "",
                height: 120,
                width: 200,),
                Text(
                  textAlign: TextAlign.center,
                  maxLines: 2
                  ,cart!.carts![index].products![1].title ?? "",
                style:const TextStyle(fontSize: 15),)
              ],
            ),
          );
        }),
    );
  }
}