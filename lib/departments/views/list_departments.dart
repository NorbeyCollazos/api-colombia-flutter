import 'package:api_colombia/departments/viewmodel/department_view_model.dart';
import 'package:api_colombia/departments/views/description_department.dart';
import 'package:flutter/material.dart';
import 'package:api_colombia/departments/model/department_response.dart';
import 'package:provider/provider.dart';

class ListDepartments extends StatefulWidget {
  const ListDepartments({super.key});

  @override
  State<ListDepartments> createState() => _ListDepartmentsState();
}

class _ListDepartmentsState extends State<ListDepartments> {

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<DepartmentViewModel>(context, listen: false).getDepartments(),
    );
  }

  @override
  Widget build(BuildContext context) {

    final departmetViewModel = Provider.of<DepartmentViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Departamentos')),
      body: departmetViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : departmetViewModel.errorMessage != null
          ? Center(child: Text('Error: ${departmetViewModel.errorMessage}'))
          : departmetViewModel.departments.isEmpty
          ? const Center(child: Text('No hay departamentos disponibles'))
          : departmentsList(departmetViewModel.departments),
    );
  }

  ListView departmentsList(List<DepartmentResponse> departments) {
    return ListView.builder(
      itemCount: departments.length,
      itemBuilder: (context, index) {
        final department = departments[index];
        return ListTile(
          leading: Hero(
            tag: department.id,
            child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(
                'assets/images/icono_colombia_department.jpg',
              ),
              backgroundColor: Colors.grey[200],
            ),
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
  }
}
