class Course {
  final String title;
  final String description;
  final List<String> lessons;

  Course({required this.title, required this.description, required this.lessons});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'],
      description: json['description'],
      lessons: List<String>.from(json['lessons']),
    );
  }
}
