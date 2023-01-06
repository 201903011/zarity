import 'package:flutter/material.dart';
import 'package:zarity/models/Task.dart';

class ListCard extends StatefulWidget {
  const ListCard({super.key, required this.task});
  final Task task;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
              child: Column(
                children: [
                  Text(
                    widget.task.name,
                    style: TextStyle(
                        color: Theme.of(context).buttonColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(widget.task.Day),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(widget.task.task),
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4.0),
                  child: Text(
                    "Open Dialogue",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
    ;
  }
}
