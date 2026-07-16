import '../models/mail.dart';

const List<Mail> dummyMails = [
  Mail(
    sender: '데이터베이스 교수님',
    subject: '과제 제출 안내',
    preview: '이번 달 30일까지 데이터베이스 과제를 제출하세요.',
    time: '오후 2:30',
  ),
  Mail(
    sender: 'GitHub',
    subject: 'Repository activity',
    preview: '새로운 커밋이 email-app 저장소에 push되었습니다.',
    time: '오전 11:10',
  ),
  Mail(
    sender: '네이버',
    subject: '새로운 로그인 알림',
    preview: '새로운 기기에서 로그인이 감지되었습니다.',
    time: '어제',
  ),
];
