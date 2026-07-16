import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: const Center(
        child: Text(
          '메일 계정 설정 화면',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}