import 'package:bmiusingbloc/staeLogic.dart';
import 'package:bmiusingbloc/stateEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();
  @override
  _HomeState createState() => _HomeState();
}

String getBmiMessage(double bmi) {
  if (bmi == 0) {
    return "BMI value is empty";
  } else {
    if (bmi < 18.5) {
      return "Your weight is below normal. Try to gain some weight.";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Your weight is normal.";
    } else if (bmi >= 25 && bmi < 30) {
      return "You are slightly overweight. Try to lose some weight.";
    } else {
      return "You are overweight. Consider a healthier lifestyle.";
    }
  }
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double? h;
    double? w;
    final _controllerWeight = TextEditingController();
    final _controllerHeight = TextEditingController();
    final bloc = BlocProvider.of<BlocState>(context);
    //final res = bloc.state.weight / (bloc.state.height * bloc.state.height);
    return Center(
      child: Container(
        width: 250,
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //scrollDirection: Axis.vertical,
          children: [
            TextField(
              controller: _controllerWeight,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                labelText: "Enter your Weight",
                hintMaxLines: 0,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty && double.tryParse(value) != null) {
                  final weight = double.parse(value);
                  context.read<BlocState>().add(updateWeight(weight: weight));
                  context.read<BlocState>().add(CalculateEvent());
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter valid numbers")),
                  );
                }
              },
            ),
            TextField(
              controller: _controllerHeight,
              decoration: InputDecoration(
                  labelText: "Enter your height",
                  hintMaxLines: 0,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty && double.tryParse(value) != null) {
                  final height = double.parse(value);
                  context.read<BlocState>().add(updateHeight(height: height));
                  context.read<BlocState>().add(CalculateEvent());
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter valid numbers")),
                  );
                }
              },
            ),
            BlocBuilder<BlocState, StateLogic>(
              builder: (context, state) => ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text(
                                  " result = ${state.bmi.toStringAsFixed(2)}  "),
                              content: Text(
                                getBmiMessage(state.bmi),
                              ));
                        });
                    _controllerHeight.clear();
                    _controllerWeight.clear();
                  },
                  child: const Text("Calculate Bmi")),
            )
          ],
        ),
      ),
    );
  }
}
