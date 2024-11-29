import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'course.dart';

class CourseListScreen extends StatelessWidget {
  final String token;

  CourseListScreen({required this.token});

  Future<List<Course>> fetchCourses(String token) async {
    final response = await http.get(
      Uri.parse('https://your-backend-api.com/api/courses'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final List coursesData = json.decode(response.body);
      return coursesData.map((course) => Course.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Courses')),
      body: FutureBuilder<List<Course>>(
        future: fetchCourses(token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final courses = snapshot.data;
            return ListView.builder(
              itemCount: courses?.length,
              itemBuilder: (context, index) {
                final course = courses![index];
                return ListTile(
                  title: Text(course.title),
                  subtitle: Text(course.description),
                  onTap: () {
                    // Navigate to course details
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
