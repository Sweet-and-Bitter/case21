import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirai/mirai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

// Определяем состояния
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<dynamic> items; // Замените dynamic на ваш тип данных

  HomeLoaded(this.items);
}

// Определяем события (если необходимо)
abstract class HomeEvent {}

class LoadHomeEvent extends HomeEvent {}

// Создаем HomeBloc
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TextEditingController controller = TextEditingController();

  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final items = await loadJson();
        emit(HomeLoaded(items));
      } catch (e) {
        emit(HomeInitial()); 
      }
    });
  }
  
  Future<List<dynamic>> loadJson() async {
    final String jsonString = await rootBundle.loadString('assets/screen.json');
    print(jsonString); 
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList;
  }
}