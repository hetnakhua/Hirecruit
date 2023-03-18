import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirecruit/ui/screens/tabs/jobs_applied_tab.dart';
import 'package:hirecruit/ui/screens/tabs/jobs_created_tab.dart';
import 'package:hirecruit/ui/widgets/my_tab.dart';
import 'package:hirecruit/ui/widgets/navbar.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {

  List<Widget> myTabs = const [
    // jobs applied
    MyTab(
      titleText: 'Jobs Applied',
    ),

    // jobs created
    MyTab(
      titleText: 'Jobs Created',
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Status', style: GoogleFonts.lato(),),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [

              const SizedBox(height: 24),

              // tab bar
              TabBar(tabs: myTabs),

              // tab bar view
              Expanded(
                child: TabBarView(children: [
                  // jobs applied tab page
                  JobsAppliedTab(),

                  // burger tab
                  JobsCreatedTab(),
                ]),
              )
            ],
          ),
        ),
        
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}