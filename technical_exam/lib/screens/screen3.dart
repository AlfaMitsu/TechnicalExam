import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final TextEditingController _textController = TextEditingController();
  String _reversedString = '';

  @override
  void initState() {
    super.initState();
    _loadSavedValue();
  }

  Future<void> _loadSavedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedValue = prefs.getString('inputValue') ?? '';
    setState(() {
      _textController.text = savedValue;
      _reverseString(savedValue);
    });
  }

  void _reverseString(String enteredString) {
    String reversedString = '';
    for (int i = enteredString.length - 1; i >= 0; i--) {
      reversedString += enteredString[i];
      if (i > 2) {
        reversedString +=
            '2';
      }
    }
    setState(() {
      _reversedString = reversedString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              Text(
                _reversedString,
                style: const TextStyle(color: Colors.blue, fontSize: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
