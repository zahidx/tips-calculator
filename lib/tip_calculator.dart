import 'package:flutter/material.dart';

class TipsCalculatorPage extends StatefulWidget {
  const TipsCalculatorPage({Key? key}) : super(key: key);

  @override
  _TipsCalculatorPageState createState() => _TipsCalculatorPageState();
}

class _TipsCalculatorPageState extends State<TipsCalculatorPage> {
  double totalBill = 0.0;
  double tipPercentage = 0.0;
  int numberOfPeople = 1;

  double totalTip = 0.0;
  double totalAmount = 0.0;
  double amountPerPerson = 0.0;

  void calculate() {
    setState(() {
      totalTip = totalBill * tipPercentage / 100;
      totalAmount = totalBill + totalTip;
      amountPerPerson = totalAmount / numberOfPeople;
    });
  }

  void clearFields() {
    setState(() {
      totalBill = 0.0;
      tipPercentage = 0.0;
      numberOfPeople = 1;
      totalTip = 0.0;
      totalAmount = 0.0;
      amountPerPerson = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tips Calculator',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.blueGrey[100],
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    Text(
                      '\$${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Person',
                              style: TextStyle(fontSize: 18.0, color: Colors.black),
                            ),
                            Text(
                              '$numberOfPeople',
                              style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Tip',
                              style: TextStyle(fontSize: 18.0, color: Colors.black),
                            ),
                            Text(
                              '\$${totalTip.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount Per Person',
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                        Text(
                          '\$${amountPerPerson.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              key: Key('total_bill_input'),
              decoration: InputDecoration(
                labelText: 'Total Bill',
                border: OutlineInputBorder(),
                prefixText: '\$',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  totalBill = double.tryParse(value) ?? 0.0;
                  calculate();
                });
              },
            ),
            SizedBox(height: 8.0),
            TextField(
              key: Key('tip_percentage_input'),
              decoration: InputDecoration(
                labelText: 'Tip Percentage',
                border: OutlineInputBorder(),
                suffixText: '%',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  tipPercentage = double.tryParse(value) ?? 0.0;
                  calculate();
                });
              },
            ),
            SizedBox(height: 8.0),
            TextField(
              key: Key('number_of_people_input'),
              decoration: InputDecoration(
                labelText: 'Number of People',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  numberOfPeople = int.tryParse(value) ?? 1;
                  calculate();
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: calculate,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: clearFields,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      'Clear',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
