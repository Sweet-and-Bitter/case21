import 'package:flutter/material.dart';
import 'package:mirai/mirai.dart';
import 'login_screen.dart';
import 'user_management_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Mirai.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/userManagementScreen': (context) => const UserScreen(),
      },
    );
  }
}