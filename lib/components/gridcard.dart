import 'package:flutter/material.dart';
import 'package:zarity/models/CTA.dart';

class GridCard extends StatefulWidget {
  const GridCard({super.key, required this.cta});
  final CTA cta;
  @override
  State<GridCard> createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFB1B1BB),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Positioned(
          top: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.cta.name,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  weight: 3,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}
