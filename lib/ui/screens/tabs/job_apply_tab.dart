import 'package:flutter/material.dart';
import 'package:hirecruit/constants/color.dart';
import 'package:hirecruit/models/job_model.dart';
import 'package:hirecruit/ui/widgets/job_card.dart';

class JobsApplyTab extends StatefulWidget {
  const JobsApplyTab({super.key});

  @override
  State<JobsApplyTab> createState() => _JobsApplyTabState();
}

class _JobsApplyTabState extends State<JobsApplyTab> {
  List<JobCard> job = [
    JobCard(
      company: 'Google',
      title: 'Web Developer',
      imageUrl:
          'https://53.fs1.hubspotusercontent-na1.net/hub/53/hubfs/image8-2.jpg?width=893&height=600&name=image8-2.jpg',
      jobDescription: 'Web developer with html,css',
      skills: ['html', 'css', 'javascript'],
      salary: 8000.0,
      status: [1, 0, 0],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 200,
                    spreadRadius: 2,
                    offset: Offset(8, 4))
              ]),
              child: JobCard(
                company: job[index].company,
                title: job[index].title,
                imageUrl: job[index].imageUrl,
                jobDescription: job[index].jobDescription,
                skills: job[index].skills,
                salary: job[index].salary,
                status: [1, 0, 0],
              ),
            );
          },
          itemCount: job.length,
        ),
      ),
    );
  }
}
