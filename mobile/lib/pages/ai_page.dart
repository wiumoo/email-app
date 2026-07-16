import 'package:flutter/material.dart';

class AiPage extends StatelessWidget {
  const AiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI 메일 도우미'),
      ),
      body: const Center(
        child: Text(
          'AI 기능은 다음 단계에서 추가합니다.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}