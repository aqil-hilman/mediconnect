import 'package:flutter/material.dart';

class SecureChatPage extends StatefulWidget {
  const SecureChatPage({super.key});

  @override
  State<SecureChatPage> createState() => _SecureChatPageState();
}

class _SecureChatPageState extends State<SecureChatPage> {
  int _currentIndex = 1;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // TOP BLUE BAR
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr Suga',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Chat Messages
            Expanded(
              child: Container(
                color: const Color(0xFFF5F5F5),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white, // White background
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    'can i postpone',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueAccent, // Blue text
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '06:07',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.blueAccent.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12),
                      
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent, // Blue background
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(4),
                                    ),
                                  ),
                                  child: const Text(
                                    'No sorry',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white, // White text
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      '06:07',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.blueAccent.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12),
                      
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white, // White background
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    'Okay dr',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueAccent, // Blue text
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '06:07',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.blueAccent.withOpacity(0.7),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(
                                      Icons.check_circle,
                                      size: 12,
                                      color: Colors.blueAccent, // Blue check mark
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ), 
                    ],
                  ),
                ),
              ),
            ),
            
            // Message Input Field
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: 'Type a message...',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.blueAccent.withOpacity(0.5),
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              // Send message action
                              if (_messageController.text.isNotEmpty) {
                                _messageController.clear();
                              }
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}