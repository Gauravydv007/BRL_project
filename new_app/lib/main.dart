import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import 'dart:convert';



void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Signup()


  ),
  );
}
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
  
  
  
}


  
// ignore: non_constant_identifier_names
class _SignupState extends State<Signup> {
  TextEditingController _nameController =TextEditingController();

var url = "https://jsonplaceholder.typicode.com/photos";
void initState(){
    super.initState();
    getData();
  }
  getData() async{
    var res = await http.get(url as Uri);
    data = jsonDecode(res.body);
    print(data);
    setState(() {
      
    });
  }


  var data;
  @override
  Widget build(BuildContext context) {
    var data;
    return Scaffold(
     
     appBar: AppBar(
      title: const Text("Signup Here"),
     ),
     body: Padding(
      padding: EdgeInsets.all(16.0),

      
        child: data!=null? 
        ListView.builder(
              itemBuilder:(context, index) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListTile(
                  title: Text(data[index]["title"]),
                  leading: Image.network(data[index]["url"]),
                ),
                  );

              },
              itemCount: data.length,
              
              )

          
          
          :Center(child: CircularProgressIndicator(),
          ),
     )
    );
     
 
    
  }
}
