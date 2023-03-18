import 'package:flutter/material.dart';
import 'package:hirecruit/constants/color.dart';
import 'package:hirecruit/ui/widgets/job_card.dart';

class JobsCreateTab extends StatefulWidget {
  const JobsCreateTab({super.key});

  @override
  State<JobsCreateTab> createState() => _JobsCreateTabState();
}

class _JobsCreateTabState extends State<JobsCreateTab> {
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
        child: Column(
          children: [
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: darkBlue,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(Icons.add_circle_outline_outlined, size: 36,),
                ),
              ),
            ),
            SizedBox(height: 30),
            ListView.builder(
              shrinkWrap: true,
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
          ],
        ),
      ),
    );
  }
}
