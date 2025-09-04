import 'package:api_colombia/regions/models/region_response.dart';
import 'package:api_colombia/regions/services/repository.dart';
import 'package:flutter/material.dart';

class RegionsViewModel extends ChangeNotifier {
  final RegionsRepository repository = RegionsRepository();
  List<RegionResponse> _regions = [];
  List<RegionResponse> get regions => _regions;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getRegions() async {
    try {
      _isLoading = true;
      notifyListeners();

      _regions = await repository.fetchRegions();
      _errorMessage = null;
    } catch (exception) {
      _errorMessage = exception.toString();
      _regions = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
