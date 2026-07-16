import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void openAccountConnectionPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MailAccountConnectionPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
            child: Text(
              '연결된 메일 계정',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.email_outlined),
            ),
            title: Text('연결된 계정이 없습니다'),
            subtitle: Text('메일 계정을 연결해 통합 받은편지함을 사용하세요.'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('메일 계정 추가'),
            subtitle: const Text('이메일 주소와 비밀번호로 연결'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              openAccountConnectionPage(context);
            },
          ),
        ],
      ),
    );
  }
}

class MailAccountConnectionPage extends StatefulWidget {
  const MailAccountConnectionPage({super.key});

  @override
  State<MailAccountConnectionPage> createState() {
    return _MailAccountConnectionPageState();
  }
}

class _MailAccountConnectionPageState
    extends State<MailAccountConnectionPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;
  bool isConnecting = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> connectAccount() async {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() {
      isConnecting = true;
    });

    await Future<void>.delayed(
      const Duration(seconds: 1),
    );

    if (!mounted) {
      return;
    }

    setState(() {
      isConnecting = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${emailController.text} 계정 연결 기능은 백엔드 단계에서 구현합니다.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메일 계정 연결'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '메일 계정 정보를 입력하세요.',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '일부 서비스는 일반 비밀번호 대신 앱 비밀번호가 필요할 수 있습니다.',
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [
                  AutofillHints.email,
                ],
                decoration: const InputDecoration(
                  labelText: '이메일 주소',
                  hintText: 'example@email.com',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  final email = value?.trim() ?? '';

                  if (email.isEmpty) {
                    return '이메일 주소를 입력하세요.';
                  }

                  if (!email.contains('@')) {
                    return '올바른 이메일 주소를 입력하세요.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: hidePassword,
                autofillHints: const [
                  AutofillHints.password,
                ],
                decoration: InputDecoration(
                  labelText: '비밀번호 또는 앱 비밀번호',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력하세요.';
                  }

                  return null;
                },
                onFieldSubmitted: (_) {
                  connectAccount();
                },
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: isConnecting ? null : connectAccount,
                icon: isConnecting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.link),
                label: Text(
                  isConnecting ? '연결 확인 중...' : '계정 연결',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}