import 'package:flutter/material.dart';
import 'time_table_page.dart';
import 'class_student_list_page.dart';
import 'menu_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassTimePageView extends StatefulWidget {
  const ClassTimePageView({super.key});

  @override
  State<ClassTimePageView> createState() => _ClassTimePageViewState();
}

class _ClassTimePageViewState extends State<ClassTimePageView> {
  final PageController _controller = PageController();
  int _selectedTab = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top black bar
        Container(
          height: 30,
          width: double.infinity,
          color: Colors.black,
        ),

        // Main content with AppBar
        Expanded(
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 218, 170),
            drawer: const MenuDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 70,
              automaticallyImplyLeading: false,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              title: Row(
               children: [
  const Text(
    'Ed',
    style: TextStyle(
      color: Colors.indigo,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
  const Text(
    'Live',
    style: TextStyle(
      color: Colors.lightBlue,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
  const Spacer(),
  SvgPicture.asset(
    'assets/icons/notification.svg', // your asset path
    height: 24,
    width: 24,
    color: Colors.black, // Or white based on your background
  ),
  const SizedBox(width: 16),
  const CircleAvatar(backgroundColor: Colors.grey),
],
              ),
            ),

            // Body with full white rounded container
            body: SafeArea(
              child: Column(
                children: [
             Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Top-left back icon as clickable text
      GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Text(
          "< Back",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),

      const SizedBox(height: 8),

      // Title row with SVG + text
      Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Color(0xFF2E3192), // Background color
              borderRadius: BorderRadius.circular(6),
            ),
            child: SvgPicture.asset(
              'assets/icons/class_time.svg', // your asset path
              height: 24,
              width: 24,
              color: Colors.white, // Icon color
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            "Class &Time",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D2DA3),
            ),
          ),
        ],
      ),
    ],
  ),
),

                  // White card with tab bar + page content
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          // Tab bar inside white container
                        Padding(
  padding: const EdgeInsets.all(10), // 16px padding for tab titles
  child: Row(
    children: [
      GestureDetector(
        onTap: () => _onTabTapped(0),
        child: Text(
          'Time',
          style: TextStyle(
            color: _selectedTab == 0 ? Colors.blue : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(width: 8),
      GestureDetector(
        onTap: () => _onTabTapped(1),
        child: Text(
          'ClassPerformance',
          style: TextStyle(
            color: _selectedTab == 1 ? Colors.blue : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Spacer(),
      const Icon(Icons.more_vert),
    ],
  ),
),

                          const SizedBox(height: 16),

                          // Page content below tab bar
                         Expanded(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1),
    child: PageView(
      controller: _controller,
      onPageChanged: (index) {
        setState(() => _selectedTab = index);
      },
      children: const [
        TimeTablePage(),
        ClassStudentListPage(),
      ],
    ),
  ),
),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
