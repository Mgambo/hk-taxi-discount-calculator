import 'package:flutter/material.dart';
import '../consts/languages/chinese.dart';
import '../components/price.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final newPriceController = TextEditingController();

  void calculatePrice(value) {
    double newPrice = 0;
    setState(() {
      if (value != '' && double.tryParse(value) != null) {
        newPrice = double.parse(value) * 0.85;
      } else {
        newPrice = 0;
      }
      newPriceController.text = newPrice.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[    
            Padding(padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: '24',
                onChanged: calculatePrice,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  labelText: label.originalPrice,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: '0',
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  labelText: label.extraPrice,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                readOnly: true,
                controller: newPriceController,
                decoration: InputDecoration(
                  prefixText: '\$ ',
                  labelText: label.newPrice,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: priceField(label: label.eightyFive)
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: priceField(label: label.ninety)
            )
          ],
        ),
      )
    );
  }
}
