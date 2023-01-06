import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zarity/components/Header.dart';
import 'package:zarity/components/gridcard.dart';
import 'package:zarity/components/listcard.dart';
import 'package:zarity/components/normalText.dart';
import 'package:zarity/models/CTA.dart';
import 'package:zarity/models/Task.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Good Afternoon",
                style: TextStyle(
                    color: Theme.of(context).buttonColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: Header()),
            NormalText(text: "View your Insights"),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("cta_list").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Text("Loading");
                else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 16),
                      itemBuilder: (context, index) {
                        return GridCard(
                            cta: CTA.fromMap(
                                snapshot.requireData.docs[index].data()));
                      },
                      itemCount: snapshot.requireData.docs.length,
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Show a list",
                style: TextStyle(
                    color: Theme.of(context).buttonColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            NormalText(text: "Immediate"),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("task_list")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Text("Loading");
                else {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.requireData.docs.length,
                    itemBuilder: (context, index) {
                      return ListCard(
                          task: Task.fromMap(
                              snapshot.requireData.docs[index].data()));
                    },
                  );
                }
              },
            ),
            NormalText(text: "This Week"),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("task_list")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Text("Loading");
                else {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.requireData.docs.length,
                    itemBuilder: (context, index) {
                      return ListCard(
                          task: Task.fromMap(
                              snapshot.requireData.docs[index].data()));
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
