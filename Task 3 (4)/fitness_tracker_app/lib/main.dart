import 'package:fitness_tracker_app/pages/home/widgets/details/widgets/details.dart';
import 'package:fitness_tracker_app/pages/home/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const fitness_tracker_app());
}

class fitness_tracker_app extends StatelessWidget {
  const fitness_tracker_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => Home(), '/details': (context) => Details()},
      initialRoute: '/details',
      home: Details(),
    );
  }
}
