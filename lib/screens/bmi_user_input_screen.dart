import 'package:bmi_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BmiUserInputScreen extends StatefulWidget {
  @override
  State<BmiUserInputScreen> createState() => _BmiUserInputScreenState();
}

class _BmiUserInputScreenState extends State<BmiUserInputScreen> {
  var weightTxt = TextEditingController();

  var heightFeetTxt = TextEditingController();

  var heightInchTxt = TextEditingController();

  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BMI',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.4),
            ),
            CustomTextField(
                controllerTxt: weightTxt,
                keyboardType: TextInputType.number,
                hintText: 'Enter Weight',
                labelText: 'Enter your Weight(in Kgs)',
                onChanged: (weightTxt) {}),
            CustomTextField(
                controllerTxt: heightFeetTxt,
                keyboardType: TextInputType.number,
                hintText: 'Enter Height',
                labelText: 'Enter your Height(in Feet)',
                onChanged: (heightFeetTxt) {}),
            CustomTextField(
                controllerTxt: heightInchTxt,
                keyboardType: TextInputType.number,
                hintText: 'Enter Height',
                labelText: 'Enter your Height(in inch)',
                onChanged: (heightInchTxt) {}),
            ElevatedButton.icon(
                onPressed: () {
                  var wt = weightTxt.text.toString();
                  var ht = heightFeetTxt.text.toString();
                  var hit = heightInchTxt.text.toString();

                  if (wt.trim() == '') {
                    Fluttertoast.showToast(
                        msg: "Please Enter Weight(in Kgs)",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (ht.trim() == '') {
                    Fluttertoast.showToast(
                        msg: "Please Enter Height(in Feet)",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (hit.trim() == '') {
                    Fluttertoast.showToast(
                        msg: "Please Enter Height(in inch)",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    var weight = double.parse(wt);
                    var heightF = double.parse(ht);
                    var heightInch = double.parse(hit);

                    var tInch = (heightF * 12) + heightInch;
                    var tCm = tInch + 2.54;
                    var tM = tCm / 100;
                    var bmi = weight / (tM + tM);
                    setState(() {
                      result = "Your BMI is $bmi";
                    });
                  }
                },
                icon: const Icon(Icons.calculate_rounded),
                label: const Text('Calculate')),
            Text(result),
          ],
        ),
      ),
    );
  }
}
