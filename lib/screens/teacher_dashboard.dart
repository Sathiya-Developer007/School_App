import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_app/screens/todo_list_screen.dart';
import 'menu_drawer.dart';

class TeacherDashboardPage extends StatelessWidget {
  const TeacherDashboardPage({super.key});

  @override
Widget build(BuildContext context) {
  return Column(
    children: [
      // 🆕 Black bar at the very top
      Container(
        height: 30,
        width: double.infinity,
        color: Colors.black,
      ),
      // 🔽 The rest of the app below the black bar
      Expanded(
        child: Scaffold(
          backgroundColor: const Color(0xFFF4F4F4),
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
              children: const [
                Text('Ed',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
                Text('Live',
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
                Spacer(),
                Icon(Icons.notifications_none, color: Colors.black),
                SizedBox(width: 16),
                CircleAvatar(backgroundColor: Colors.grey),
              ],
            ),
          ),
        
      body: ListView(
        
        padding: const EdgeInsets.all(1),
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              DashboardTile(
                title: 'Notifications',
                subtitle: 'PTA meeting on 12, Feb. 2019',
                iconPath: 'assets/icons/notification.svg',
                color: Color(0xFFFFF176),
                badgeCount: 1,
              ),
              DashboardTile(
                title: 'Achievements',
                subtitle: 'Congratulate your student',
                iconPath: 'assets/icons/achievements.svg',
                color: Color(0xFFFFF176),
                badgeCount: 1,
              ),
              DashboardTile(
                title: 'My to-do list',
                subtitle: 'Make your own list, set reminder.',
                iconPath: 'assets/icons/todo.svg',
                color: Color(0xFFB3E5FC),
                badgeCount: 4,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ToDoListPage()),
                  );
                },
              ),
              DashboardTile(
                title: 'Reports',
                subtitle: 'Progress report updated',
                iconPath: 'assets/icons/reports.svg',
                color: Color(0xFFFFEBEE),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DashboardTile(
                  title: 'Attendance',
                  iconPath: 'assets/icons/attendance.svg',
                  color: Color(0xFFFFCDD2),
                  centerContent: true,
                ),
              ),
              const SizedBox(width: 12),
            Expanded(
  child: GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/classtime'); // ✅ Navigates to Class & Time screen
    },
    child: DashboardTile(
      title: 'Class & Time',
      iconPath: 'assets/icons/class_time.svg',
      color: Color(0xFFFFECB3),
      centerContent: true,
    ),
  ),
),

            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DashboardTile(
                  title: 'Payments',
                  iconPath: 'assets/icons/payments.svg',
                  color: Color(0xFFC5E1A5),
                  badgeCount: 3,
                  centerContent: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DashboardTile(
                  title: 'Exams',
                  iconPath: 'assets/icons/exams.svg',
                  color: Color(0xFFA5D6A7),
                  badgeCount: 2,
                  centerContent: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DashboardTile(
                  title: 'Transport',
                  iconPath: 'assets/icons/transport.svg',
                  color: Color(0xFFB3E5FC),
                  centerContent: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DashboardTile(
                  title: 'Message',
                  iconPath: 'assets/icons/message.svg',
                  color: Color(0xFFE1BEE7),
                  centerContent: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              DashboardTile(
                title: 'Events & Holidays',
                subtitle: '16 Jan 2019, Pongal',
                iconPath: 'assets/icons/events.svg',
                color: Color(0xFFF8BBD0),
              ),
              DashboardTile(
                title: 'PTA',
                subtitle: 'Next meeting: 22 Sep. 2019',
                iconPath: 'assets/icons/pta.svg',
                color: Color(0xFFD7CCC8),
              ),
              DashboardTile(
                title: 'Library',
                subtitle: '16 Jan 2019, Pongal',
                iconPath: 'assets/icons/library.svg',
                color: Color(0xFFB3E5FC),
                badgeCount: 1,
              ),
              DashboardTile(
                title: 'Syllabus',
                subtitle: 'Lessons to be completed',
                iconPath: 'assets/icons/syllabus.svg',
                color: Color(0xFFAED581),
              ),
              DashboardTile(
                title: 'Special care',
                subtitle: 'Students need your support',
                iconPath: 'assets/icons/special_care.svg',
                color: Color(0xFFFFE082),
              ),
              DashboardTile(
                title: 'Co curricular activities',
                subtitle: 'NCC Camp on 23, Jan.2019',
                iconPath: 'assets/icons/co_curricular.svg',
                color: Color(0xFFF0F4C3),
              ),
              DashboardTile(
                title: 'Quick notes',
                subtitle: 'Note anything worth noting',
                iconPath: 'assets/icons/quick_notes.svg',
                color: Color(0xFFCE93D8),
              ),
              DashboardTile(
                title: 'Resources',
                subtitle: 'Useful links and study materials',
                iconPath: 'assets/icons/resources.svg',
                color: Color(0xFFD1C4E9),
              ),
            ],
          ),
        ],
      ),
    ))]);
  }
}

class DashboardTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String iconPath;
  final Color color;
  final int? badgeCount;
  final bool centerContent;
  final VoidCallback? onTap;

  const DashboardTile({
    super.key,
    required this.title,
    required this.iconPath,
    required this.color,
    this.subtitle,
    this.badgeCount,
    this.centerContent = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final svgIcon = SvgPicture.asset(
      iconPath,
      height: 30,
      width: 30,
      color: const Color(0xFF0D47A1),
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: centerContent ? 100 : null,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            centerContent
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        svgIcon,
                        const SizedBox(height: 8),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF0D47A1),
                          ),
                        ),
                      ],
                    ),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      svgIcon,
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFF0D47A1),
                              ),
                            ),
                            if (subtitle != null)
                              Text(
                                subtitle!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
            if (badgeCount != null)
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    badgeCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
