import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  int _selectedIndex = -1;

  final List<Map<String, dynamic>> _menuItems = [
    {
      'icon': 'achievements.svg',
      'label': 'Achievements',
      'route': '/achievements',
    },
    {'icon': 'todo.svg', 'label': 'My to-do list', 'route': '/todo'},
    {'icon': 'reports.svg', 'label': 'Reports', 'route': '/reports'},
    {'icon': 'attendance.svg', 'label': 'Attendance', 'route': '/attendance'},
    {'icon': 'class_time.svg', 'label': 'Class & Time', 'route': '/class_time'},
    {'icon': 'payments.svg', 'label': 'Payments', 'route': '/payments'},
    {'icon': 'exams.svg', 'label': 'Exams', 'route': '/exams'},
    {'icon': 'transport.svg', 'label': 'Transport', 'route': '/transport'},
    {'icon': 'message.svg', 'label': 'Message', 'route': '/message'},
    {'icon': 'events.svg', 'label': 'Events & Holidays', 'route': '/events'},
    {'icon': 'pta.svg', 'label': 'PTA', 'route': '/pta'},
    {'icon': 'library.svg', 'label': 'Library', 'route': '/library'},
    {'icon': 'syllabus.svg', 'label': 'Syllabus', 'route': '/syllabus'},
    {
      'icon': 'special_care.svg',
      'label': 'Special care',
      'route': '/special_care',
    },
    {
      'icon': 'co_curricular.svg',
      'label': 'Co curricular activities',
      'route': '/co_curricular',
    },
    {
      'icon': 'quick_notes.svg',
      'label': 'Quick notes',
      'route': '/quick_notes',
    },
    {'icon': 'resources.svg', 'label': 'Resources', 'route': '/resources'},
    {'icon': 'school.svg', 'label': 'My School', 'route': '/school'},
    {'icon': 'calendar.svg', 'label': 'Calendar', 'route': '/calendar'},
    {'icon': 'settings.svg', 'label': 'Settings', 'route': '/settings'},
    {'icon': 'help.svg', 'label': 'Help', 'route': '/help'},
    {'icon': 'terms.svg', 'label': 'Terms and conditions', 'route': '/terms'},
    {'icon': 'logout.svg', 'label': 'Logout', 'route': '/'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _menuItems.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final item = _menuItems[index];
                  final isSelected = _selectedIndex == index;

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF29ABE2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/${item['icon']}',
                        height: 24,
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: Text(
                        item['label'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () async {
                        setState(() => _selectedIndex = index);

                        if (item['label'] == 'Logout') {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.remove('auth_token');
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/',
                            (route) => false,
                          );
                        } else {
                          Navigator.pushNamed(context, item['route']);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
