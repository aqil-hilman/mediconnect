
import 'package:flutter/material.dart';
import 'profile.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.blueAccent,
          indicatorColor: const Color(0xFF105EE6),
          iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return const IconThemeData(color: Colors.white);
              }
              return const IconThemeData(color: Colors.white70);
            },
          ),
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return const TextStyle(color: Colors.white);
              }
              return const TextStyle(color: Colors.white);
            },
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
            // Navigation logic
            if (index == 0 || index == 2) {
              // For Home and Profile, go to ProfilePage
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
                (route) => false,
              );
            }
          },
          indicatorColor: const Color(0xFF105EE6),
          selectedIndex: _currentIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined, color: Colors.white),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.calendar_month),
              icon: Icon(Icons.calendar_month_outlined, color: Colors.white),
              label: 'Appointment',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outlined, color: Colors.white),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.blueAccent),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Doctor's Schedule",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 48,
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose desired date and time and click check to verify availability of doctor',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    const Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '17/08/2025',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'DD/MM/YYYY',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildCalendar(),
                    
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.chevron_left, size: 24, color: Colors.grey),
                const Text(
                  'Aug      ➤      2025',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(Icons.chevron_right, size: 24, color: Colors.grey),
              ],
            ),
          ),
          
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('S', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14)),
                Text('M', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14)),
                Text('T', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14)),
                Text('W', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14)),
                Text('T', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14)),
                Text('F', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14)),
                Text('S', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14)),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            child: Column(
              children: [
                // Week 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _DayText('26', isOtherMonth: true),
                    _DayText('27', isOtherMonth: true),
                    _DayText('28', isOtherMonth: true),
                    _DayText('29', isOtherMonth: true),
                    _DayText('30', isOtherMonth: true),
                    _DayText('31', isOtherMonth: true),
                    _DayText('1', isOtherMonth: true),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Week 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _DayText('2'),
                    _DayText('3'),
                    _DayText('4'),
                    _DayText('5'),
                    _DayText('6'),
                    _DayText('7'),
                    _DayText('8'),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Week 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _DayText('9'),
                    _DayText('10'),
                    _DayText('11'),
                    _DayText('12'),
                    _DayText('13'),
                    _DayText('14'),
                    _DayText('15'),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Week 4
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _DayText('16'),
                    _DayText('17', isSelected: true), // Selected date
                    _DayText('18'),
                    _DayText('19'),
                    _DayText('20'),
                    _DayText('21'),
                    _DayText('22'),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Week 5
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _DayText('23'),
                    _DayText('24'),
                    _DayText('25'),
                    _DayText('26'),
                    _DayText('27'),
                    _DayText('28'),
                    _DayText('29'),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Week 6
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _DayText('30'),
                    _DayText('1', isOtherMonth: true),
                    _DayText('2', isOtherMonth: true),
                    _DayText('3', isOtherMonth: true),
                    _DayText('4', isOtherMonth: true),
                    _DayText('5', isOtherMonth: true),
                    _DayText('6', isOtherMonth: true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DayText extends StatelessWidget {
  final String day;
  final bool isSelected;
  final bool isOtherMonth;
  
  const _DayText(this.day, {this.isSelected = false, this.isOtherMonth = false});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueAccent : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Text(
        day,
        style: TextStyle(
          fontSize: 14,
          color: isSelected 
            ? Colors.white 
            : isOtherMonth 
              ? Colors.grey.shade400 
              : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}