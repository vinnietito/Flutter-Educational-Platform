import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  CourseDetailScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Title
            Text(
              course.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Course Description
            Text(
              course.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 24),
            // Lessons Header
            Text(
              "Lessons",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Lessons List
            Expanded(
              child: ListView.builder(
                itemCount: course.lessons.length,
                itemBuilder: (context, index) {
                  final lesson = course.lessons[index];
                  return ListTile(
                    leading: Icon(Icons.play_circle_fill, color: Colors.blue),
                    title: Text(
                      lesson,
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      // Handle lesson click (e.g., play video or open lesson details)
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("You selected: $lesson"),
                      ));
                    },
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
