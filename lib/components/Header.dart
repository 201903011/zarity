import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "John Doe",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        Spacer(),
        Container(
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Text("Show Dialogue       "),
              ),
              Positioned(
                bottom: 4,
                right: 0,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "3",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffff0000)),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(14)),
        ),
        SizedBox(
          width: 30,
        )
      ],
    );
  }
}
