import 'package:flutter_test/flutter_test.dart';
import 'package:mail_app/main.dart';

void main() {
  testWidgets('로그인 화면이 표시된다', (WidgetTester tester) async {
    await tester.pumpWidget(const EmailApp());

    expect(find.text('Email App'), findsOneWidget);
    expect(find.text('로그인'), findsOneWidget);
  });
}