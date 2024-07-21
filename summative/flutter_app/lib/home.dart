import 'package:flutter/material.dart';
import 'package:flutter_app/apiHelpers/get_prediction.dart';
import 'package:flutter_app/components/input_field.dart';
import 'package:flutter_app/components/primary_action_button.dart';
import 'package:flutter_app/validators/age_validator.dart';
import 'package:flutter_app/validators/bmi_validator.dart';
import 'package:flutter_app/validators/number_of_children_validator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  bool _isSmoker = false;
  double? _prediction;
  Color _predictionDisplayColor = Colors.black;
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _bmiController = TextEditingController();
  final TextEditingController _numberOfChildrenController =
      TextEditingController();

  final double _spaceBetweenWidgets = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Insurance Predictor'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputField(
                controller: _ageController,
                validator: ageValidator,
                label: 'Age',
              ),
              SizedBox(
                height: _spaceBetweenWidgets,
              ),
              InputField(
                controller: _bmiController,
                validator: bmiValidator,
                label: 'Body-Mass Index',
              ),
              SizedBox(
                height: _spaceBetweenWidgets,
              ),
              InputField(
                controller: _numberOfChildrenController,
                validator: numberOfChildrenValidator,
                label: 'Number of children/dependents',
              ),
              SizedBox(
                height: _spaceBetweenWidgets,
              ),
              Row(
                children: [
                  const Text('Does the subject smoke?'),
                  const Spacer(),
                  Switch(
                    value: _isSmoker,
                    onChanged: (value) {
                      setState(() {
                        _isSmoker = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: _spaceBetweenWidgets,
              ),
              PrimaryActionButton(
                label: 'Predict',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Processing parameters to make a prediction.',
                        ),
                      ),
                    );

                    // Extract form data
                    double bmi = double.parse(_bmiController.text);
                    double age = double.parse(_ageController.text);
                    int numberOfChildren = int.parse(
                      _numberOfChildrenController.text,
                    );

                    double prediction = await getPrediction(
                      age,
                      bmi,
                      numberOfChildren,
                      _isSmoker,
                    );

                    setState(() {
                      _prediction = prediction;
                      _predictionDisplayColor = Colors.red;
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          _predictionDisplayColor = Colors.black;
                        });
                      });
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _prediction != null
                        ? 'Prediction: USD ${_prediction!.toStringAsFixed(2)}'
                        : '',
                    style:
                        TextStyle(color: _predictionDisplayColor, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
