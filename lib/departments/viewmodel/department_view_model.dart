import 'package:api_colombia/departments/model/department_response.dart';
import 'package:api_colombia/departments/services/repository.dart';
import 'package:flutter/widgets.dart';

class DepartmentViewModel extends ChangeNotifier {
  final DepartmentsRepository repository = DepartmentsRepository();

  List<DepartmentResponse> _departments = [];
  List<DepartmentResponse> get departments => _departments;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getDepartments() async {
    try {
      _isLoading = true;
      notifyListeners();

      _departments = await repository.fetchDepartments();
      _errorMessage = null;
    } catch (exception) {
      _errorMessage = exception.toString();
      _departments = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
