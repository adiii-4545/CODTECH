import 'package:fitness_tracker_app/pages/home/appbar.dart';
import 'package:fitness_tracker_app/pages/home/widgets/bottom_navigation.dart';
import 'package:fitness_tracker_app/pages/home/widgets/dates.dart';
import 'package:fitness_tracker_app/pages/home/widgets/graph.dart';
import 'package:fitness_tracker_app/pages/home/widgets/info.dart' hide Stats;
import 'package:fitness_tracker_app/pages/home/widgets/stats.dart';
import 'package:fitness_tracker_app/pages/home/widgets/steps.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(appBar: AppBar()),
      body: Column(
        children: const [
          Dates(),
          Steps(),
          Graph(),
          Info(),
          Divider(height: 30),
          Stats(),
          SizedBox(height: 30),
          BottomNavigation(),
        ],
      ),
    );
  }
}
