import 'package:flutter/material.dart';
import 'package:mediconnect/first_page.dart';
import 'package:mediconnect/appointment.dart';
import 'package:mediconnect/current_appointment.dart';
import 'package:mediconnect/medical_history.dart';
import 'package:mediconnect/chat.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentPageIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.blueAccent,
          indicatorColor: const Color(0xFF105EE6),
          
          iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
            (states){
              if(states.contains(MaterialState.selected)){
                return const IconThemeData(color: Colors.white);
              }
              return const IconThemeData(color: Colors.white70);
            }
          ),
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (states){
              if(states.contains(MaterialState.selected)){
                return const TextStyle(color: Colors.white);
              }
              return const TextStyle(color: Colors.white);
            },
          ),
        ), 
        child: NavigationBar(
          onDestinationSelected: (int index){
            setState(() {
              currentPageIndex = index;
            });
            
            // Navigation logic
            if (index == 1) {
              // For Appointment button, navigate to AppointmentPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AppointmentPage()),
              );
              // Reset index to stay on Home (index 0)
              Future.delayed(Duration.zero, () {
                setState(() {
                  currentPageIndex = 0;
                });
              });
            } else if (index == 2) {
              // For Profile, stay on current profile page (index 2)
              currentPageIndex = 2;
            }
          },
          indicatorColor: const Color(0xFF105EE6),
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined, color: Colors.white,),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.calendar_month),
              icon: Icon(Icons.calendar_month_outlined, color: Colors.white,),
              label: 'Appointment',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outlined, color: Colors.white,),
              label: 'Profile',
            ),
          ],
        ),
      ), 
      
      body: <Widget>[        
        // Home Page
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 0, 90, 215), // Blue
                Color(0xFF0071C8), // Light Blue
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 42,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'MediConnect',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    ),
                ),
                Container(                
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, User',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 51, 51, 51)
                        ),
                        ),
                      Container(
                        //height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueAccent,
                              Colors.lightBlueAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Image.asset('assets/logo.png', scale: 8,),
                            Expanded(
                              child: Text(
                                'Welcome to MediConnect Smart Healthcare Appointment Platform',
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  height: 1.15
                                ),
                                ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          // MAKE APPOINTMENT BUTTON
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AppointmentPage()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(1, 3),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ]
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    size: 120,
                                    color: Colors.blueAccent,
                                  ),
                                  Text(
                                    'Make Appointment',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // CHECK APPOINTMENT BUTTON
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CurrentAppointmentPage()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(1, 4),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ]
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.calendar_view_day,
                                    size: 110,
                                    color: Colors.blueAccent,
                                  ),
                                  Text(
                                    'Check\nAppointment',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]
                      ),
                      Row(
                        children: [
                          // MEDICAL HISTORY BUTTON
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MedicalHistoryPage()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(1, 4),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ]
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.history,
                                    size: 120,
                                    color: Colors.blueAccent,
                                  ),
                                  Text(
                                    'Medical History',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // CHAT BUTTON
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ChatPage()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(1, 4),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ]
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.chat_bubble_outline_outlined,
                                    size: 120,
                                    color: Colors.blueAccent,
                                  ),
                                  Text(
                                    'Chat',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),

        // Appointment - Empty container (will navigate to AppointmentPage instead)
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 0, 90, 215), // Blue
                Color(0xFF0071C8), // Light Blue
              ],
            ),
          ),
          ),

        //==============================
        // Profile Page        
        //==============================
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 0, 90, 215), // Blue
                Color(0xFF0071C8), // Light Blue
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Stack(
                      children: [
                        Positioned(
                          left: 0, 
                          child: IconButton(
                            onPressed: () => {
                              currentPageIndex = 0,
                              setState(() {})
                            },
                            icon: Icon(
                              Icons.arrow_back, 
                              color: Colors.white, 
                              size: 32,
                            ),
                          )
                        ),
                        Positioned(
                          right: 0, 
                          child: IconButton(
                            onPressed: () => {
                              Navigator.pushReplacement(
                                  context, 
                                  MaterialPageRoute(builder: (context)=> const FirstPage()))
                            },
                            icon: Icon(
                              Icons.logout, 
                              color: Colors.white, 
                              size: 32,
                            ),
                          )
                        ),                             
                        Center(
                          child: Text(
                            'Your Profile',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ],
                      
                    ),
                ),
                Container(     
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
                    color: Colors.white,
                  ),               
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 92,
                            height: 92,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(62),
                              color: Colors.grey,
                            ),
                            child: Icon(Icons.person, size: 72,),
                          ),
                        ),
                        SizedBox(height: 24),
                        const Text(
                          'Email Address',                  
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your email address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color:  Color(0xFF0071C8), width: 1),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),
                        SizedBox(height: 24),
                        const Text(
                          'Password',                  
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color:  Color(0xFF0071C8), width: 1),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),
                        SizedBox(height: 24),
                        const Text(
                          'Birthdate',                  
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your birthdate',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color:  Color(0xFF0071C8), width: 1),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),
                        SizedBox(height: 24),
                        const Text(
                          'Name',                  
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color:  Color(0xFF0071C8), width: 1),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),
                        SizedBox(height: 80),
                        Center(
                          child: SizedBox(
                            width: 200,                  
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadowColor: Colors.blueAccent.withOpacity(0.5),
                                elevation: 5,
                              ),
                              onPressed: () {
                                // Update info
                              }, 
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,),
                              )
                            ),
                          ),
                        ),       
                        SizedBox(height: 40)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),  
      ][currentPageIndex],
    );
  }
}