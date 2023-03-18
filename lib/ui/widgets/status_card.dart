import 'package:flutter/material.dart';
import 'package:hirecruit/constants/color.dart';

class StatusCard extends StatefulWidget {
  final String company;
  final String title;
  final String imageUrl;
  final String jobDescription;
  final List skills;
  final double salary;
  final List<int> status;

  StatusCard(
      {required this.company,
      required this.title,
      required this.imageUrl,
      required this.jobDescription,
      required this.skills,
      required this.salary,
      required this.status});

  @override
  State<StatusCard> createState() => _StatusCardState();
}

Text getStatus(List<int> status) {
  if (status[0] == 1 && status[1] == 0 && status[2] == 0)
    return Text(
      'Under Review',
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  else if (status[0] == 0 && status[1] == 1 && status[2] == 0)
    return Text(
      'Accepted',
      style: TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    );
  else if (status[0] == 0 && status[1] == 0 && status[2] == 1)
    return Text(
      'Rejected',
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  return Text('loading...');
}

class _StatusCardState extends State<StatusCard> {
  // @override
  // Widget build(BuildContext context) {
  //   String status =
  //       widget.status[0]; // get the first status from the status list
  //   Widget statusIcon;
  //   Color statusColor;

  //   // check the status and set the statusIcon and statusColor accordingly
  //   if (status == "Applied") {
  //     statusIcon = Icon(Icons.bookmark_border, color: Colors.blue);
  //     statusColor = Colors.blue;
  //   } else if (status == "Interview") {
  //     statusIcon = Icon(Icons.check_circle_outline, color: Colors.green);
  //     statusColor = Colors.green;
  //   } else if (status == "Rejected") {
  //     statusIcon = Icon(Icons.cancel_outlined, color: Colors.red);
  //     statusColor = Colors.red;
  //   } else {
  //     // if the status is not recognized, display a Placeholder widget
  //     statusIcon = Placeholder();
  //     statusColor = Colors.grey;
  //   }

  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(7),
  //     ),
  //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
  //     color: white,
  //     elevation: 5,
  //     child: Padding(
  //       padding: const EdgeInsets.all(10.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Row(
  //                 children: [
  //                   Container(
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(40),
  //                     ),
  //                     height: 20,
  //                     child: Image.network(
  //                       widget.imageUrl,
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                   SizedBox(width: 12),
  //                   Text(
  //                     widget.company,
  //                     style: TextStyle(fontSize: 15),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   statusIcon, // display the status icon
  //                   SizedBox(width: 8),
  //                   Text(
  //                     status,
  //                     style: TextStyle(
  //                       color: statusColor,
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16,
  //                     ),
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //           // ...
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        color: white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getStatus(widget.status),
                ],
              ),
              Divider(
                color: Colors.grey[400],
              ),
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
    );
  }
}
