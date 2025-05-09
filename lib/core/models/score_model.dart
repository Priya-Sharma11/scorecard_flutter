import 'package:predox_website/core/models/batter_models.dart';
import 'package:predox_website/core/models/bowlers_models.dart';
import 'wicket_model.dart';

class ScoreModel {
  final int runs;
  final int wickets;
  final double overs;
  final List<BatterModel> batters;
  final List<BowlerModel> bowlers;
  final List<WicketModel> fallOfWickets;

  ScoreModel({
    required this.runs,
    required this.wickets,
    required this.overs,
    required this.batters,
    required this.bowlers,
    required this.fallOfWickets,
  });
}
