import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codetest/models/launch.dart';
import 'package:codetest/services/api_service.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final launchesProvider = FutureProvider<List<Launch>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchLaunches();
});
