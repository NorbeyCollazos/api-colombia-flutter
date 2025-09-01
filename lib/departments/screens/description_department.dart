import 'package:api_colombia/departments/data/model/department_response.dart';
import 'package:flutter/material.dart';

class DepartmentDetailScreen extends StatelessWidget {
  final DepartmentResponse department;

  const DepartmentDetailScreen({super.key, required this.department});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(department.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/images/image_department.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                department.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                department.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 24),
              Text(
                'Ciudad Capital',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                department.cityCapital.name,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                department.cityCapital.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}