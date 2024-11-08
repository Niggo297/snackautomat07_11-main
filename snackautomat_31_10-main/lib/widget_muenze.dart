import 'package:flutter/material.dart';

class MuenezUI extends StatelessWidget {
  final int muenzeWert;
  final VoidCallback onPressed;

  const MuenezUI({required this.muenzeWert, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            muenzeWert.toString(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
