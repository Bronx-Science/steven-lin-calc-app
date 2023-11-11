import 'package:flutter/material.dart';
import 'historyscreen.dart';
import 'historymanager.dart'; // Ensure this import is added
import 'historyrecord.dart'; // Ensure this import is added

class RecipeCalculator extends StatefulWidget {
  @override
  _RecipeCalculatorState createState() => _RecipeCalculatorState();
}

class _RecipeCalculatorState extends State<RecipeCalculator> {
  final _formKey = GlobalKey<FormState>();
  double originalServing = 1;
  double desiredServing = 1;
  double originalAmount = 1;
  double? newAmount;

  void calculateNewAmount() async {
    double calculatedAmount = originalAmount * (desiredServing / originalServing);
    setState(() {
      newAmount = calculatedAmount;
    });
    // Save the calculation to history
    await saveHistory(HistoryRecord(
      originalServing: originalServing,
      desiredServing: desiredServing,
      originalAmount: originalAmount,
      newAmount: calculatedAmount,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Calculator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Original Serving Size'),
              keyboardType: TextInputType.number,
              onChanged: (value) => originalServing = double.tryParse(value) ?? 1,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Desired Serving Size'),
              keyboardType: TextInputType.number,
              onChanged: (value) => desiredServing = double.tryParse(value) ?? 1,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Original Amount of Ingredient'),
              keyboardType: TextInputType.number,
              onChanged: (value) => originalAmount = double.tryParse(value) ?? 1,
            ),
            ElevatedButton(
              onPressed: calculateNewAmount,
              child: Text('Calculate'),
            ),
            if (newAmount != null) Text('New Amount: $newAmount'),
          ],
        ),
      ),
    );
  }
}
