import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/layout/traveler_cubit/state.dart';
import 'package:traveler/modules/home_module/home_screen.dart';
import 'package:traveler/modules/rating_module/rating_screen.dart';
import 'package:traveler/modules/user_module/user_screen.dart';

class TravelerCubit extends Cubit<TravelerState>{
  TravelerCubit() : super(TravelerInitialState());

  static TravelerCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens =[
    HomeScreen(),
    RatingScreen(),
    UserScreen(),
  ];

  List<String> title = [
    'Traveler',
    'Rating',
    'Profile',
  ];

  void changeBottomNav(int index){
    currentIndex = index;
    emit(TravelerChangeNavBarSuccessState());
  }
}