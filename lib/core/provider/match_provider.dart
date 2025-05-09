import 'package:flutter/material.dart';

import 'package:predox_website/core/data/match_model_dummy_data.dart';
import 'package:predox_website/core/models/match_model.dart';

class MatchProvider with ChangeNotifier {
  List<MatchModel> _matches = [];
  MatchModel? _selectedMatch;
  bool _isLoading = true;

  List<MatchModel> get matches => _matches;
  MatchModel? get selectedMatch => _selectedMatch;
  bool get isLoading => _isLoading;

  MatchProvider() {
    // Initialize here
    _matches = dummyMatches;
  }

  void loadMatches() {
    _matches = dummyMatches;
    notifyListeners();
  }

  void selectMatch(String id) {
    _selectedMatch = _matches.firstWhere((m) => m.id == id,
        orElse: () => throw Exception('Match not found'));
    notifyListeners();
  }

  List<MatchModel> get sortedMatches {
    final live = _matches.where((m) => m.type == MatchType.live).toList();
    final upcoming =
        _matches.where((m) => m.type == MatchType.upcoming).toList();
    final completed =
        _matches.where((m) => m.type == MatchType.completed).toList();

    return [...live, ...upcoming, ...completed];
  }

  Future<void> fetchedMatchById(String matchId) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    try {
      _selectedMatch = dummyMatches.firstWhere((m) => m.id == matchId,
          orElse: () => throw Exception('Match not found'));
    } catch (e) {
      _selectedMatch = null;
    }
    _isLoading = false;
    notifyListeners();
  }
}
