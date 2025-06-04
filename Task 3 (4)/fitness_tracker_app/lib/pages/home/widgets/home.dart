import 'package:fitness_tracker_app/pages/home/widgets/activity.dart';
import 'package:fitness_tracker_app/pages/home/widgets/bottom_navigation.dart';
import 'package:fitness_tracker_app/pages/home/widgets/current.dart';
import 'package:fitness_tracker_app/pages/home/widgets/details/widgets/header.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Header(), Current(), Activity(), BottomNavigation()],
      ),
    );
  }
}
