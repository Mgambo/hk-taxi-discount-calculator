import 'package:flutter/material.dart';

class priceField extends StatelessWidget {
  String label;
  String price;
  static final priceController = TextEditingController();

  priceField({Key? key, required this.label, required this.price}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: <Widget>[
          Container(
            child:
              Text(
                label,
                textAlign: TextAlign.center, 
                style: const TextStyle(fontSize: 18.0),
              )
          ),
          Text(price, textAlign: TextAlign.center)
        ]
      )
    );
  }
}