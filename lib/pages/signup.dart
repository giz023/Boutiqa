import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:boutiqa/pages/homepage.dart';
import "package:boutiqa/pages/home.dart";
import 'package:boutiqa/pages/designerhome.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Choose your account type", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image(image: AssetImage("assets/signup.png")),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                ElevatedButton(onPressed: (){
                }, child: Text("user"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                ),

                ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DesignFirstPage()),);
                }, child: Text("designer"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                )
              ],),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFF1DE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Name",),),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFF1DE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "username",),),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFF1DE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "create password",),),
              ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => firstpage()),);
                  }, child: Text("sign up"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ),
                )
            ],)
        
          ],
        ),
      ),
    );
  }
}
