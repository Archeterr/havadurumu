import "package:flutter/material.dart";
import "package:havadurumu/screens/WeatherApp.dart";


void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: "Hava Durumu",
      home: Scaffold(
        appBar: AppBar(title: const Text("KONYA",style: TextStyle(fontWeight: FontWeight.w300,letterSpacing: 10),),centerTitle: true,),
        body: const WeatherApp(),
      ),  
    );
  }
}