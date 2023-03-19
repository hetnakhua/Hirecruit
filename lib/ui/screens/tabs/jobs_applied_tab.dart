import 'package:flutter/material.dart';
import 'package:hirecruit/constants/color.dart';
import 'package:hirecruit/models/job_model.dart';
import 'package:hirecruit/ui/widgets/job_card.dart';
import 'package:hirecruit/ui/widgets/status_card.dart';

class JobsAppliedTab extends StatefulWidget {
  const JobsAppliedTab({super.key});

  @override
  State<JobsAppliedTab> createState() => _JobsAppliedTabState();
}

class _JobsAppliedTabState extends State<JobsAppliedTab> {
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
    ),
    JobDetails(
      company: 'Microsoft',
      title: 'Product Manager',
      imageUrl:
          'https://assets.website-files.com/5ee732bebd9839b494ff27cd/5eef3a3260847d0d2783a76d_Microsoft-Logo-PNG-Transparent-Image.png',
      jobDescription: 'Web developer with html,css',
      skills: ['html', 'css', 'javascript'],
      salary: 8000.0,
      rating: 4.4,
      status: [0, 1, 0],
    ),
    JobDetails(
      company: 'Facebook',
      title: 'Web Developer',
      imageUrl:
          'https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png',
      jobDescription: 'Web developer with html,css',
      skills: ['html', 'css', 'javascript'],
      salary: 8000.0,
      rating: 4.4,
      status: [0, 0, 1],
    ),
    JobDetails(
      company: 'Sogolytics',
      title: 'Full Stack Engineer',
      imageUrl:
          'https://static.crozdesk.com/web_app_library/providers/logos/000/009/848/box/sogolytics-1676430099-logo.png?1676430099',
      jobDescription: 'Web developer with html,css',
      skills: ['html', 'css', 'javascript'],
      salary: 8000.0,
      rating: 4.4,
      status: [0, 0, 1],
    ),
    JobDetails(
      company: 'Ola',
      title: 'App Developer',
      imageUrl:
          'https://i.pinimg.com/originals/e9/3a/6e/e93a6ead3f6784c21a6620d1102ea88f.jpg',
      jobDescription: 'App developer with good understanding of flutter',
      skills: ['html', 'css', 'javascript'],
      salary: 8000.0,
      rating: 4.4,
      status: [0, 1, 0],
    ),
    JobDetails(
      company: 'Facebook',
      title: 'Backend Engineer',
      imageUrl:
          'https://deadline.com/wp-content/uploads/2022/08/Netflix_Symbol_logo.jpg',
      jobDescription:
          'Web developer with good understanding of Express and Node',
      skills: ['html', 'css', 'javascript'],
      salary: 8000.0,
      rating: 4.4,
      status: [1, 0, 0],
    ),
    JobDetails(
      company: 'Facebook',
      title: 'Web Developer',
      imageUrl:
          'https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png',
      jobDescription: 'Web developer with html,css',
      skills: ['html', 'css', 'javascript'],
      salary: 8000.0,
      rating: 4.4,
      status: [0, 0, 1],
    ),
    JobDetails(
      company: 'Facebook',
      title: 'Web Developer',
      imageUrl:
          'https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png',
      jobDescription: 'Web developer with html,css',
      skills: ['html', 'css', 'javascript'],
      salary: 8000.0,
      rating: 4.4,
      status: [0, 1, 0],
    ),
    JobDetails(
      company: 'Facebook',
      title: 'Web Developer',
      imageUrl:
          'https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png',
      jobDescription: 'Web developer with html,css',
      skills: ['html', 'css', 'javascript'],
      salary: 8000.0,
      rating: 4.4,
      status: [0, 0, 1],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView.builder(
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
                child: StatusCard(
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
      ),
    );
  }
}
