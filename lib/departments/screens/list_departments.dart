import 'package:api_colombia/departments/screens/description_department.dart';
import 'package:flutter/material.dart';
import 'package:api_colombia/departments/data/model/department_response.dart';
import 'package:api_colombia/departments/data/repository.dart';

class ListDepartments extends StatelessWidget {
  const ListDepartments({super.key});

  @override
  Widget build(BuildContext context) {
    final DepartmentsRepository repository = DepartmentsRepository();

    return Scaffold(
      appBar: AppBar(title: const Text('Departamentos')),
      body: FutureBuilder<List<DepartmentResponse>>(
        future: repository.fetchDepartments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No hay departamentos disponibles'),
            );
          }

          final departments = snapshot.data!;

          return ListView.builder(
            itemCount: departments.length,
            itemBuilder: (context, index) {
              final department = departments[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(
                    'assets/images/icono_colombia_department.jpg',
                  ),
                  backgroundColor: Colors.grey[200],
                ),
                title: Text(department.name),
                subtitle: Text(department.cityCapital.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DepartmentDetailScreen(department: department),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
