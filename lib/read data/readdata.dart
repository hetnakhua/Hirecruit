import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GetJobData extends StatelessWidget {
  final String documentId;
  GetJobData({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');
    return FutureBuilder<DocumentSnapshot>(
        future: jobs.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['title']}');
          }
          return Text('Loading ....');
        }));
  }
}
