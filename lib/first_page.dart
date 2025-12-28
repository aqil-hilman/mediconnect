import 'package:flutter/material.dart';
import 'package:mediconnect/login.dart';
import 'package:mediconnect/register.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0071C8), // Blue
              Color(0xFF68A6D6), // Light Blue
            ],
          ),
        ),
        child: Container(     
          margin: EdgeInsets.only(top: 85, left: 20, right: 20, bottom: 75),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),               
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 60),
              Image.asset(
                'assets/logo-blue.png',
                width: 150,
                height: 150,
              ),              
              const Text(
              'MediConnect',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
              const Text(
                'Welcome to MediConnect Smart Healthcare Appointment Platform',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 250),
              Text("Already have an account?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadowColor: Colors.blueAccent.withOpacity(0.5),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => LoginPage()));
                  }, 
                  child: Text(
                    'Login',
                    style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,),
                  )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New user? ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                    },                     
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    )
                  ),                

                ],
              ),              
            ],
          ),
        ),
      )
    );
  }
}