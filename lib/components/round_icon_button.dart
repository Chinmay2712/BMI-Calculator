import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, required this.onPressed});

  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      elevation: 0.0,
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(
        height: 50.0,
        width: 50.0,
      ),
      child: Icon(icon),
    );
  }
}
