import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/login_page.dart'; // ✅ Correct path for LoginPage

import 'screens/teachers/teacher_dashboard.dart';
import 'screens/teachers/todo_list_screen.dart';
import 'screens/teachers/time_table_page.dart';
import 'screens/teachers/class_student_list_page.dart';
import 'screens/teachers/class_time_pageview.dart';
import 'screens/teachers/teacher_profile_page.dart';
import 'screens/teachers/settings.dart';

import 'screens/students/student_dashboard.dart';
import 'screens/students/select_child_page.dart';

import 'providers/task_provider.dart';
import 'providers/settings_provider.dart';

import 'providers/timetable_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
         ChangeNotifierProvider(create: (_) => TimetableProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EDLive School App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),

        // Teacher Routes
        '/dashboard': (context) => const TeacherDashboardPage(),
        '/todo': (context) => const ToDoListPage(),
        '/classtime': (context) => const ClassTimePageView(),
        '/profile': (context) => const TeacherProfilePage(),
        '/settings': (context) => const SettingsPage(),

        // Student Routes
        '/student-dashboard': (context) => const StudentDashboardPage(),

        // Parent Routes
        '/select-child': (context) => const SelectChildPage(),
      },
    );
  }
}
