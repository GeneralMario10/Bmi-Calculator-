import 'package:bmiusingbloc/homeScreenUi.dart';
import 'package:bmiusingbloc/stateEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark, // Dark theme
          scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: Colors.lightBlue),
          ),
        ),
        themeMode: ThemeMode.dark,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Bmi Application"),
            ),
            body: Center(
                child: BlocProvider(
              create: (_) => BlocState(),
              child: HomeScreen(),
            ))));
  }
}
