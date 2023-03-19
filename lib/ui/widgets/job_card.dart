import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hirecruit/constants/color.dart';

class JobCard extends StatefulWidget {
  final String company;
  final String title;
  final String imageUrl;
  final String jobDescription;
  final List skills;
  final double salary;
  final List<int> status;

  JobCard({
    required this.company,
    required this.title,
    required this.imageUrl,
    required this.jobDescription,
    required this.skills,
    required this.salary,
    required this.status,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  Future<QuerySnapshot<Map<String, dynamic>>> getJobs() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('jobs').get();
    return querySnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getJobs(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        List<JobCard> jobCards = [];

        snapshot.data!.docs
            .forEach((DocumentSnapshot<Map<String, dynamic>> doc) {
          Map<String, dynamic> jobData = doc.data()!;
          JobCard jobCard = JobCard(
            company: jobData['company'],
            title: jobData['title'],
            imageUrl: jobData['imageUrl'],
            jobDescription: jobData['jobDescription'],
            skills: List<String>.from(jobData['skills']),
            salary: jobData['salary'].toDouble(),
            status: List<int>.from(jobData['status']),
          );
          jobCards.add(jobCard);
        });

        return ListView(
          children: jobCards,
        );
      },
    );
  }
}
