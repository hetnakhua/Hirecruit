import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirecruit/constants/color.dart';
import 'package:hirecruit/models/profile_model.dart';
import 'package:hirecruit/ui/widgets/navbar.dart';
import 'package:hirecruit/ui/widgets/re_use.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String name = 'Het Nakhua';
  final String email = 'hetsnakhua@gmail.com';

  List<String> allSkills = [
    'Flutter',
    'Firebase',
    'Flask',
    // 'HTML',
    // 'CSS',
    // 'Java',
  ];
  List<EducationModel> allEducation = [
    EducationModel(uni: 'HFS', duration: '2013-2019'),
    EducationModel(uni: 'KJ', duration: '2019-2021'),
    EducationModel(uni: 'DJ', duration: '2021-2025'),
  ];

  List<ProjectModel> allProjects = [
    ProjectModel(
        title: 'Spark',
        desc:
            'Created an ML-powered blind dating app with Flutter, Firebase and Scikit. It analyzes your data and uses matching algorithms to pair you with potential matches that share your interests, values and personality traits'),
    ProjectModel(
        title: 'Smokey Dough',
        desc:
            'My role in this client project is to design and implement an interface for a client in flutter and dart.'),
  ];

  List<ExperienceModel> allExperience = [
    ExperienceModel(
        title: 'Google- SDE Intern',
        desc:
            'Developed and maintained a Java-based application that automated the data processing workflow for the marketing team, resulting in a 20% reduction in processing time.'),
    ExperienceModel(
        title: 'Microsoft- UI UX Intern',
        desc:
            'Conducted user research to identify pain points and opportunities for improvement in the company\'s mobile app. Created user personas and developed wireframes and interactive prototypes to test design concepts.'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: BackButton(color: Colors.black),
          title: Text(
            'Profile',
            style: GoogleFonts.lato(color: black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),

              // profile pic
              Container(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/profile avatar.png'),
                  radius: 60,
                ),
              ),

              SizedBox(height: 16),

              // name
              Text(
                name,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),

              // email id
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    email,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // upload pdf
                    GestureDetector(
                      onTap: () {},
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: [3, 3],
                        color: darkBlue,
                        strokeWidth: 3,
                        radius: Radius.circular(16),
                        child: Container(
                          height: 100,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outline_outlined,
                                  size: 36,
                                ),
                                Text('Upload pdf'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    // skills heading
                    Text(
                      'Skills',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    // skills listview
                    Row(
                      children: allSkills
                          .map(
                            (skill) => Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: lightBlue,
                              ),
                              child: Text(skill),
                            ),
                          )
                          .toList(),
                    ),

                    SizedBox(height: 20),

                    // education heading
                    Text(
                      'Education',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    // education listview
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(allEducation[index].uni),
                                Text(allEducation[index].duration),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: allEducation.length,
                    ),

                    SizedBox(height: 20),

                    // projects heading
                    Text(
                      'Projects',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    // projects listview
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 48,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
                            child: Container(
                              width: 210,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    allProjects[index].title,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    allProjects[index].desc,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: allProjects.length,
                      ),
                    ),

                    SizedBox(height: 20),

                    // experience heading
                    Text(
                      'Experience',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    // experience listview
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 48,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
                            child: Container(
                              width: 210,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    allExperience[index].title,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    allExperience[index].desc,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: allExperience.length,
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
