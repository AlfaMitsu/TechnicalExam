import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    Future<void> saveData(String key, String value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please input a text to display on the third screen',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            TextField(
              controller: textController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String inputValue = textController.text;
                saveData('inputValue', inputValue);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Text successfully set',
                      style: TextStyle(color: Colors.white)
                    ),
                    backgroundColor: Colors.grey.shade800,
                    duration: const Duration(seconds: 2),
                  ),
                );
                textController.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'SUBMIT',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
