import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String url = '';
  String output = "0";

   factorial(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter and Flask Api connection app"), backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Enter any number: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
                onChanged: (value) {
                  url = "http://10.0.2.2:5000/factorial?number=" + value.toString();
                },
              ),
            ),
            TextButton(onPressed:() async {
              var op = await factorial(url);
              var decoded = jsonDecode(op);
              setState(() {
                output = decoded['output'];
              });
            }, child: Text("Submit", style: TextStyle(fontSize: 25, color: Colors.black),)),
            SizedBox(height: 40,),
            Text('The factorial is ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 7,),
            Text(output, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)
          ],),
        ),
      ),
    );
  }
}