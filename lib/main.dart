import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_teacher.dart';
import 'screens/teacher_dashboard.dart';
import 'screens/todo_list_screen.dart';
import 'providers/task_provider.dart';
import 'screens/time_table_page.dart';
import 'screens/class_student_list_page.dart';
import 'screens/class_time_pageview.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TaskProvider())],
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
        '/': (context) => const TeacherLoginPage(),
        '/dashboard': (context) => const TeacherDashboardPage(),
        '/todo': (context) => const ToDoListPage(),
        '/classtime': (context) => const ClassTimePageView(),
        
      },
    );
  }
}
