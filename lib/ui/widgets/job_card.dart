import 'package:flutter/material.dart';
import 'package:hirecruit/constants/color.dart';
import 'package:hirecruit/ui/screens/job_expanded.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200.withOpacity(.1),
            blurRadius: 20.0,
            spreadRadius: 0.0,
            offset: Offset(
              8.0,
              4.0,
            ),
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => JobExpandedScreen()));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
          color: white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          height: 20,
                          child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          widget.company,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.bookmark,
                          size: 30,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 5),
                Text(
                  "Job:\n${widget.jobDescription}",
                  style: TextStyle(fontWeight: FontWeight.w400, height: 1.5),
                ),
                SizedBox(height: 15),
                Row(
                  children: widget.skills
                      .map((skill) => Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lightBlue,
                            ),
                            child: Text(skill),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey[400],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '\u{20B9} ${widget.salary}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Share",
                          style: TextStyle(
                              color: Color(
                                0xFF25D366,
                              ),
                              fontWeight: FontWeight.bold),
                        ),
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/2044px-WhatsApp.svg.png',
                          width: 25,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
