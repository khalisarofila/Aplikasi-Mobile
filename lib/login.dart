import 'package:flutter/material.dart';
import 'package:taskify/welcome.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 250,
                ),
              ),
              SizedBox(height: 200,),
              Center(
                child: ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=> Welcome()));
                },  style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 50), 
      primary: Colors.deepPurple,
       elevation: 5,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), 
      ),
    ),
                child: Text("Continue as a Guest" ,style: TextStyle(
                  fontSize: 20, color: Colors.white,
                ),),
                ),
                 ),
            ],
          ),
        ),
        
        ),
      )
    );
  }
}