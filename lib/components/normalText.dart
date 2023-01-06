import 'package:flutter/material.dart';

class NormalText extends StatefulWidget {
  const NormalText({super.key, required this.text});
  final String text;
  @override
  State<NormalText> createState() => _NormalTextState();
}

class _NormalTextState extends State<NormalText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
