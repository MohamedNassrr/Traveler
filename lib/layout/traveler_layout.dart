import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/layout/traveler_cubit/cubit.dart';
import 'package:traveler/layout/traveler_cubit/state.dart';
import 'package:traveler/shared/style/icon_broken.dart';

class TravelerScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TravelerCubit, TravelerState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TravelerCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.title[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  IconBroken.Search,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Star,
                  ),
                  label: 'Rating'),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Profile,
                  ),
                  label: 'Profile'
              ),
            ],
          ),
        );
      },
    );
  }
}
