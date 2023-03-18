import 'package:flutter/material.dart';
import 'package:hirecruit/models/job_model.dart';
import 'package:hirecruit/ui/widgets/job_card.dart';
import 'package:hirecruit/ui/widgets/status_card.dart';

class JobsCreatedTab extends StatefulWidget {
  const JobsCreatedTab({super.key});

  @override
  State<JobsCreatedTab> createState() => _JobsCreatedTabState();
}

class _JobsCreatedTabState extends State<JobsCreatedTab> {
  List<JobDetails> job = [
    JobDetails(
      company: 'Google',
      title: 'Web Developer',
      imageUrl:
          'https://53.fs1.hubspotusercontent-na1.net/hub/53/hubfs/image8-2.jpg?width=893&height=600&name=image8-2.jpg',
      jobDescription: 'Web developer with html,css',
      skills: ['html', 'css', 'javascript'],
      salary: 8000.0,
      rating: 4.4,
      status: [1, 0, 0],
    )
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
                status: job[index].status,
              ),
            );
          },
          itemCount: job.length,
        ),
      ),
    );
  }
}
