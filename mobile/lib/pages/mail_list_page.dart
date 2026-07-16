import 'package:flutter/material.dart';

import '../data/dummy_mails.dart';
import 'mail_detail_page.dart';

class MailListPage extends StatelessWidget {
  const MailListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('통합 받은편지함')),
      body: ListView.separated(
        itemCount: dummyMails.length,
        separatorBuilder: (context, index) {
          return const Divider(height: 1);
        },
        itemBuilder: (context, index) {
          final mail = dummyMails[index];

          return ListTile(
            leading: CircleAvatar(child: Text(mail.sender.substring(0, 1))),
            title: Text(
              mail.sender,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mail.subject),
                Text(
                  mail.preview,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            trailing: Text(mail.time),
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
