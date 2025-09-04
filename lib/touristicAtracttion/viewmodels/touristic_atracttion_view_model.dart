import 'package:api_colombia/touristicAtracttion/models/touristic_atracttion_response.dart';
import 'package:api_colombia/touristicAtracttion/services/repository.dart';
import 'package:flutter/material.dart';

class TouristicAtracttionViewModel extends ChangeNotifier {
  final TouristicAtracttionRepository repository =
      TouristicAtracttionRepository();

  List<TouristicAtracttionResponse> _attractions = [];
  List<TouristicAtracttionResponse> get attractions => _attractions;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getAttractions() async {
    try {
      _isLoading = true;
      notifyListeners();

      _attractions = await repository.getAll();
      _errorMessage = null;
    } catch (exception) {
      _errorMessage = exception.toString();
      _attractions = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
