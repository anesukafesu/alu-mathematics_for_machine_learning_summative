import 'dart:convert';

import 'package:http/http.dart';

Future<double> getPrediction(
  double age,
  double bmi,
  int numberOfChildren,
  bool isSmoker,
) async {
  // Make the request to the API, passing the parameters
  Response response = await post(
    Uri.https(
      'alu-mathematics-for-machine-learning.onrender.com',
      '/predict',
    ),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'age': age,
      'bmi': bmi,
      'children': numberOfChildren,
      'smoker': isSmoker,
    }),
  );

  // Parse response from json
  Map<String, double> responseBody = Map<String, double>.from(
    jsonDecode(response.body),
  );

  // Return the prediction property from the request
  return responseBody['prediction'] as double;
}
