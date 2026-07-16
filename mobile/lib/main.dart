import 'package:flutter/material.dart';

void main() {
  runApp(const EmailApp());
}

class EmailApp extends StatelessWidget {
  const EmailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Email App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MailListPage(),
    );
  }
}

class MailListPage extends StatelessWidget {
  const MailListPage({super.key});

  static const List<Map<String, String>> mails = [
    {
      'sender': '데이터베이스 교수님',
      'subject': '과제 제출 안내',
      'preview': '이번 달 30일까지 데이터베이스 과제를 제출하세요.',
      'time': '오후 2:30',
    },
    {
      'sender': 'GitHub',
      'subject': 'Repository activity',
      'preview': '새로운 커밋이 email-app 저장소에 push되었습니다.',
      'time': '오전 11:10',
    },
    {
      'sender': '네이버',
      'subject': '새로운 로그인 알림',
      'preview': '새로운 기기에서 로그인이 감지되었습니다.',
      'time': '어제',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('통합 받은편지함'),
      ),
      body: ListView.separated(
        itemCount: mails.length,
        separatorBuilder: (context, index) {
          return const Divider(height: 1);
        },
        itemBuilder: (context, index) {
          final mail = mails[index];

          return ListTile(
            leading: CircleAvatar(
              child: Text(mail['sender']!.substring(0, 1)),
            ),
            title: Text(
              mail['sender']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mail['subject']!),
                Text(
                  mail['preview']!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            trailing: Text(mail['time']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MailDetailPage(mail: mail);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MailDetailPage extends StatelessWidget {
  final Map<String, String> mail;

  const MailDetailPage({
    super.key,
    required this.mail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메일 상세'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mail['subject']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '보낸 사람: ${mail['sender']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '받은 시간: ${mail['time']}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const Divider(height: 32),
            Text(
              mail['preview']!,
              style: const TextStyle(
                fontSize: 17,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}