import 'package:flutter_bloc/flutter_bloc.dart';
import '../user_model.dart';
import 'package:flutter/material.dart';
import 'package:mirai/mirai.dart';


class UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;

  UserLoaded(this.users);
}

class UserCubit extends Cubit<UserState> {
  final List<User> _users = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  UserCubit() : super(UserLoading());

  void addUser() {
    final String id = DateTime.now().toString();
    final String name = nameController.text;
    final String email = emailController.text;

    if (name.isNotEmpty && email.isNotEmpty) {
      _users.add(User(id: id, name: name, email: email));
      emit(UserLoaded(_users)); // Обновляем состояние после добавления пользователя
      nameController.clear();
      emailController.clear();
    } else {
      // Вы можете добавить сообщение об ошибке, если поля пустые
      // Например, через SnackBar
    }
  }

  void editUser(User user) {
    nameController.text = user.name;
    emailController.text = user.email;

    // Здесь можно добавить логику для редактирования пользователя
    // Например, открытие диалогового окна для редактирования
  }

  void deleteUser(String id) {
    _users.removeWhere((user) => user.id == id);
    emit(UserLoaded(_users)); // Обновляем состояние после удаления пользователя
  }
}