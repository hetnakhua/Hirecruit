import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirecruit/constants/color.dart';
import 'package:hirecruit/ui/screens/tabs/job_apply_tab.dart';
import 'package:hirecruit/ui/screens/tabs/job_create_tab.dart';
import 'package:hirecruit/ui/screens/tabs/jobs_applied_tab.dart';
import 'package:hirecruit/ui/screens/tabs/jobs_created_tab.dart';
import 'package:hirecruit/ui/widgets/my_tab.dart';
import 'package:hirecruit/ui/widgets/navbar.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  List<Widget> myTabs = const [
    // jobs applied
    MyTab(
      titleText: 'Apply',
    ),

    // jobs created
    MyTab(
      titleText: 'Post',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            'Jobs',
            style: GoogleFonts.lato(color: black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SafeArea(
            child: Column(
              children: [
                // const SizedBox(height: 10),

                // tab bar
                TabBar(
                  indicatorWeight: 4,
                  dividerColor: black,
                  labelColor: darkBlue,
                  tabs: myTabs,
                  indicatorColor: darkBlue,
                ),

                // tab bar view
                const Expanded(
                  child: TabBarView(children: [
                    // jobs applied tab page
                    JobsApplyTab(),

                    // burger tab
                    JobsCreateTab(),
                  ]),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
