import 'package:flutter/material.dart';
import '../consts/languages/chinese.dart';
import '../consts/rate.dart';
import '../consts/styles/font.dart';
import '../widgets/price.dart';
import '../utils/rate.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final newPriceController = TextEditingController();
  final extraPriceController = TextEditingController();
  final oldPriceController = TextEditingController();
  final totalPriceController = TextEditingController();

  String ninetyPrice = '0';
  String eightyFivePrice = '0';

  @override
  void initState() {
    // implement initState
    super.initState();

    extraPriceController.text = '0';
    oldPriceController.text = rate.oldPrice.toString();
    newPriceController.text = rate.newPrice.toString();
    totalPriceController.text = rate.newPrice.toString();
    eightyFivePrice = (rate.newPrice * 0.85).toString();
    ninetyPrice = (rate.newPrice * 0.9).toString();
  }

  void calculatePrice(String value, String type) {
    num newPrice = 0;
    num oldPrice = 0;
    num extraPrice = 0;
    num totalPrice = 0;

    if (value == '') value = '0';

    switch (type) {
      case 'extra':
        extraPrice = num.parse(value);
        oldPrice = num.parse(oldPriceController.text);
        break;
      case 'old':
        extraPrice = num.parse(extraPriceController.text);
        oldPrice = num.parse(value);
    }

    setState(() {
      if (rateUtil().validatePrice(oldPrice)) {
        newPrice = rateUtil().calcNewPrice(oldPrice); //num.parse(value) * 0.85;
      } else {
        newPrice = 0;
      }
      newPriceController.text = newPrice.toStringAsFixed(2);
      totalPrice = newPrice + extraPrice;
      totalPriceController.text = totalPrice.toStringAsFixed(2);
      eightyFivePrice = ((newPrice * 0.85) + extraPrice).toStringAsFixed(2);
      ninetyPrice = ((newPrice * 0.9) + extraPrice).toStringAsFixed(2);
      priceField.priceController.text = ninetyPrice;
    });
  }

  String ? get oldPriceErrorText {
    final text = oldPriceController.value.text;
    String? wrongPriceText = label.errorMessage["invalidInput"];
    if (text == '') {
      return wrongPriceText;
    }
    if (num.parse(text) < 24) {
      return wrongPriceText;
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leading: Icon(Icons.menu),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: widget.title, style: const TextStyle(fontSize: 25.0)),
              const WidgetSpan(child:
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(Icons.local_taxi)
                )
              )
            ]
          )
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child:Padding(padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: oldPriceController,
                      onChanged: (value) => calculatePrice(value, 'old'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(fontSize: Styles_Font.labelFontSize),
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(fontSize: Styles_Font.labelFontSize),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: () {
                            oldPriceController.text = '0';
                            calculatePrice('0', 'old');
                          },
                          icon: const Icon(Icons.clear),
                        ),
                        labelText: label.originalPrice,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        errorText: oldPriceErrorText
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: Padding(padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: extraPriceController,
                      onChanged: (value) => calculatePrice(value, 'extra'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true), 
                      style: const TextStyle(fontSize: Styles_Font.labelFontSize),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: () {
                            extraPriceController.text = '0';
                            calculatePrice('0', 'extra');
                          },
                          icon: const Icon(Icons.clear),
                        ),
                        labelText: label.extraPrice,
                        labelStyle: const TextStyle(fontSize: Styles_Font.labelFontSize),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ), 
                )
              ]
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                readOnly: true,
                controller: newPriceController,
                style: const TextStyle(fontSize: Styles_Font.labelFontSize),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  labelStyle: const TextStyle(fontSize: Styles_Font.labelFontSize),
                  labelText: label.newPrice,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                readOnly: true,
                controller: totalPriceController,
                style: const TextStyle(fontSize: Styles_Font.labelFontSize),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  labelStyle: const TextStyle(fontSize: Styles_Font.labelFontSize),
                  labelText: label.totalPrice,
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
