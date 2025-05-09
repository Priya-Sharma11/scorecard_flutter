import 'package:predox_website/core/models/commentary_model.dart';
import 'package:predox_website/core/models/innings_model.dart';
import 'package:predox_website/core/models/team_model.dart';

class MatchModel {
  final String id;
  final TeamModel teamA;
  final TeamModel teamB;
  final List<InningsModel> inningsList;
  final List<CommentaryModel> liveCommentary;
  final String venue;
  final String season;
  final DateTime matchDateTime;
/*   final DateTime startTime; */
  final bool isLive;
  final MatchType type;
  final String liveStatus;
  final String liveSummary;

   MatchModel({
    required this.id,
    required this.teamA,
    required this.teamB,
    required this.inningsList,
    required this.liveCommentary,
    required this.venue,
    required this.season,
    required this.matchDateTime,
    required this.liveStatus,
    required this.liveSummary,
  /*   required this.startTime, */
    required this.type,
    required this.isLive,
  });
}

enum MatchType {
   live,
  upcoming,
  completed,
}