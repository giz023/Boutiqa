import 'package:firebase_auth/firebase_auth.dart';

import "package:flutter/material.dart";
import "package:boutiqa/pages/signup.dart";
import 'package:boutiqa/pages/homepage.dart';
import 'package:boutiqa/pages/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final  TextEditingController _usernameController = TextEditingController();
  final  TextEditingController _passwordController = TextEditingController();

  //signin method
  void signUserIn() async{
     // show loading circle
    showDialog(
        context: context,
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );


    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if(e.code == "user-not-found"){
        print("No user found for email");
      } else if(e.code == "wrong-password"){
        print("Wrong password");
      }
    }
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFF1DE),
      ),
      body: Container(
        color: Color(0xffFFF1DE),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(image: AssetImage("assets/logo.png")),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffFFF1DE),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "username",
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(controller: _passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffFFF1DE),
                            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "password",),),
              ),
              ElevatedButton(onPressed: signUserIn,
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => firstpage()),);


                  child: Container(
                child: Text("Login", style: TextStyle(color: Colors.white),)
                  ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),
              //Text("or", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 100),
                child: ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Signup()),);
                },
                  child: Container(
                      child: Text("Sign Up", style: TextStyle(color: Colors.white),)
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
