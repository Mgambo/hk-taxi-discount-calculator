import 'package:flutter/material.dart';

class priceField extends StatelessWidget {
  String label;
  final _controller = TextEditingController();

  priceField({Key? key, required this.label}): super(key: key);

  void controller() { _controller; }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: _controller,
      decoration: InputDecoration(
        prefixText: '\$ ',
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}