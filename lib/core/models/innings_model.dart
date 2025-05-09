import 'package:predox_website/core/models/score_model.dart';
import 'package:predox_website/core/models/team_model.dart';

class InningsModel {
  final int number; // 1 for 1st innings, 2 for 2nd innings
  final TeamModel battingTeam;
  final TeamModel bowlingTeam;
  final ScoreModel score;

  InningsModel({
    required this.number,
    required this.battingTeam,
    required this.bowlingTeam,
    required this.score,
  });
}