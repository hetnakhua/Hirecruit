import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:hirecruit/constants/color.dart';

class JobCard extends StatefulWidget {
  final String company;
  final String title;
  final String imageUrl;
  final String jobDescription;
  final List skills;
  final double salary;

  JobCard({
    required this.company,
    required this.title,
    required this.imageUrl,
    required this.jobDescription,
    required this.skills,
    required this.salary,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      color: white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 10),
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
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
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
    );
  }
}
