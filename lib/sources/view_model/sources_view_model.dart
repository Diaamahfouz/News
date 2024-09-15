import 'package:flutter/material.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/sources/data/repository/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
  final SourcesRepository repository;

  SourcesViewModel()
      : repository = SourcesRepository(ServiceLocator.sourcesDataSource);

  List<Source> sources = [];

  String? errorMessage;
  bool isLoading = false;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();

    try {
      sources = await repository.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
