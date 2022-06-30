import 'package:flutter/material.dart';
import '../consts/languages/chinese.dart';
import '../utils/rate.dart';
import '../components/price.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final newPriceController = TextEditingController();
  String ninetyPrice = '0';
  String eightyFivePrice = '0';

  void calculatePrice(value) {
    num newPrice = 0;
    setState(() {
      if (value != '' && rateUtil().validatePrice(num.parse(value))) {
        newPrice = rateUtil().calcNewPrice(num.parse(value)); //num.parse(value) * 0.85;
      } else {
        newPrice = 0;
      }
      newPriceController.text = newPrice.toString();
      eightyFivePrice = (newPrice * 0.85).toStringAsPrecision(3).toString();
      ninetyPrice = (newPrice * 0.9).toStringAsPrecision(3).toString();
      priceField.priceController.text = ninetyPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leading: Icon(Icons.menu),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(10.0),
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
            Row(
              children: [
                Expanded(
                  child: Padding(padding: const EdgeInsets.all(8.0),
                    child: priceField(label: label.eightyFive, price: eightyFivePrice)
                  )
                ),
                Expanded(
                  child: Padding(padding: const EdgeInsets.all(8.0),
                    child: priceField(label: label.ninety, price: ninetyPrice)
                  )
                )
              ]
            )
          ],
        ),
      )
    );
  }
}
