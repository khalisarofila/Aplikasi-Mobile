import 'package:flutter/material.dart';
import 'package:taskify/bottomNav.dart';
import 'package:taskify/home.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(20),
        child: Container(
          child: Column(
           
            children: [
              SizedBox(height: 200,),
             Center(
              child: Text("Welcome to Taskify", style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
              ),
              ),
             ),
             SizedBox(height: 50,),
             Center(
              child: Text("Tap the Button to Continue", style: TextStyle(
                fontSize: 20,
              ),
              ),
             ),
             SizedBox(height: 30,),
             ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=>BottomNav()
              ),
              );
             },style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
               elevation: 10,
              shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0), // Atur radius sesuai kebutuhan
    ),
    padding: EdgeInsets.all(25),
   
             ),
              child: Text("Tap", style: TextStyle(color: Colors.white),))
            ], 
          ),
        ),
        ),
      ),
    );
  }
}