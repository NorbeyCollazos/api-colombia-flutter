import 'package:api_colombia/infoColombia/models/info_response.dart';
import 'package:api_colombia/infoColombia/services/repository.dart';
import 'package:flutter/material.dart';

class InfoViewModel extends ChangeNotifier {
  final InfoRepository repository = InfoRepository();

  InfoResponse? _infoResponse;
  InfoResponse? get infoResponse => _infoResponse;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchInfo() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _infoResponse = await repository.fetchInfo();
    
    } catch (exception) {
      _infoResponse = null;
      _errorMessage = exception.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
