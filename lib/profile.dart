import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskify/login.dart';
import 'package:taskify/MySharedPref.dart';

class Profile extends StatefulWidget {

  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String namaProfil = '';
  final textController = TextEditingController();
  final MySharedPref _mySharedPref = MySharedPref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: [
              Center(
                child: Text("PROFILE", style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                ),
                ),

              ),
              SizedBox(height: 30,),
              Center(
                  child: ClipOval(
                    child: Image.asset(
                  "assets/images/logo.png",
                  width: 150,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
              Center(
                child: Text('Guest', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ) ,
                ),
              ),
              SizedBox(height: 10,),
               Center(
                child: Text("#000352", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ) ,
                ),
              ),
              SizedBox(height: 10,),
               Center(
                child: ElevatedButton(onPressed: (){Login();}, child: Text('Login'))
              ),
              SizedBox(height: 60,),
               Row(
                    children: [
                      SizedBox(width: 30,),
                      Text("My Progress", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                      ),
                   
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                       SizedBox(width: 30,),
                      Checkbox(value: true, onChanged: (bool? value){},
                      ),
                      Text("Finish the Assignment")
                      
                    ],
                  ),
                   Row(
                    children: [
                       SizedBox(width: 30,),
                      Checkbox(value: false, onChanged: (bool? value){},
                      ),
                      Text("...")
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 30,),
                      Text("Achievement", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                      ),
                      
                    
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                       SizedBox(width: 30,),
                      Checkbox(value: true, onChanged: (bool? value){},
                      ),
                      Text("Finish the Assignment")
                      
                    ],
                  ),
                   Row(
                    children: [
                       SizedBox(width: 30,),
                      Checkbox(value: false, onChanged: (bool? value){},
                      ),
                      Text("...")
                    ],
                  ),
            ],
          ),
        ),
        ),
      ),
    );
  }

  Future<void> _showAddTaskDialog(String sectionTitle) async {
    TextEditingController taskController = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit'),
          content: TextField(
            controller: textController,
            decoration: InputDecoration(hintText: 'Enter your name'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  namaProfil: textController;
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ), 
          ],
        );
      },
    );
  }
}