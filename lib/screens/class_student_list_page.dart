import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassStudentListPage extends StatelessWidget {
  const ClassStudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: Select class + 35 students
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side: "Select your class" and dropdown
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Select your class", style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 4),
                    Container(
                      width: 125,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCCCCC),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: DropdownButton<String>(
  isExpanded: true,
  value: '10A',
  underline: const SizedBox(), // remove default underline
  icon: SvgPicture.asset(
    'assets/icons/down_arrow.svg',
    height: 11,
    width: 11,
  ),
  style: const TextStyle( // 👈 Apply style to selected value
    fontSize: 40, // 🔹 Big font
    color: Color(0xFF29ABE2), // 🔹 Blue color
    fontWeight: FontWeight.bold,
  ),
  items: ['10A', '10B', '10C'].map(
    (e) => DropdownMenuItem(
      value: e,
      child: Text(
        e,
        style: const TextStyle( // 👈 Apply style to each menu item
          fontSize: 20,
          color: Color(0xFF29ABE2),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ).toList(),
  onChanged: (_) {},
),

                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Right side: student count and role
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "35 students",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "You are class teacher",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
 Padding(
  padding: EdgeInsets.only(top: 10),
  child: RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: 'Your subject: ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'English1',
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),
          const SizedBox(height: 16),

          // Student rows
          const _StudentRow(name: "1. Aabith", alert: true),
          const _StudentRow(name: "2. Abdul Rahman"),
          const _StudentRow(name: "3. Abeneendranath"),
          const _StudentRow(name: "4. Asdfghjertywuipop wetyeyiuoro"),
          const _StudentRow(name: "5. Lorem Ipsum Dolor"),
        ],
      ),
    );
  }
}

class _StudentRow extends StatelessWidget {
  final String name;
  final bool alert;
  const _StudentRow({required this.name, this.alert = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 20, backgroundColor: Colors.grey),
            const SizedBox(width: 12),
            Expanded(child: Text(name)),
            if (alert)
              const Icon(Icons.error_outline, color: Colors.red),
          ],
        ),
        const Divider( // Always adds a clear bottom border
          color: Colors.grey,
          thickness: 0.5,
          height: 16, // Space between rows
        ),
      ],
    );
  }
}
