import 'package:flutter/material.dart';

class TextFormCrud extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;
  TextEditingController item;
  final String labelTexto;
  final String valueIsEmpty;
  TextFormCrud(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.item,
      required this.labelTexto,
      required this.valueIsEmpty});

  @override
  State<TextFormCrud> createState() => _TextFormCrudState();
}

class _TextFormCrudState extends State<TextFormCrud> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: SizedBox(
        height: widget.screenHeight / 15,
        width: widget.screenWidth / 1.2,
        child: TextFormField(
          controller: widget.item,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelStyle: TextStyle(color: Color(0xFFB701D0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Color(0xFF58008D), width: 3)),
              labelText: widget.labelTexto),
          validator: (value) {
            if (value!.isEmpty) {
              return widget.valueIsEmpty;
            }
            return null;
          },
        ),
      ),
    );
  }
}
