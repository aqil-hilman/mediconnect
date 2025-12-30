// main.dart
import 'package:flutter/material.dart';
import 'package:mediconnect/first_page.dart';
import 'package:mediconnect/profile.dart'; // Add this import
import 'package:mediconnect/appointment.dart';
import 'package:mediconnect/current_appointment.dart';
import 'package:mediconnect/medical_history.dart';
import 'package:mediconnect/chat.dart';
//import 'package:mediconnect/secure_chat.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const ProfilePage(), // Profile page is your home
        '/appointment': (context) => const AppointmentPage(),
        '/current_appointment': (context) => const CurrentAppointmentPage(),
        '/medical_history': (context) => const MedicalHistoryPage(),
        '/chat': (context) => const ChatPage(),
        //'/secure_chat': (context) => const SecureChatPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FirstPage()),
      );
    });
  }
  
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 270,
              height: 270,
            ),
            const SizedBox(height: 10),
            const Text(
              'MediConnect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Smart Healthcare Appointment Platform',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )
    );
  }
}