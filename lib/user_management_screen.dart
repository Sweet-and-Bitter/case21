import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirai/mirai.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'cubit/user_cubit.dart';
import 'user_model.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(),
      child: Scaffold(
        body: FutureBuilder<String>(
          future: loadJson(), // Загружаем JSON
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final jsonMap = jsonDecode(snapshot.data!) as Map<String, dynamic>;
              return Mirai.fromJson(jsonMap, context) ?? const SizedBox(); 
            }
          },
        ),
      ),
    );
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/screen.json');
  }
}