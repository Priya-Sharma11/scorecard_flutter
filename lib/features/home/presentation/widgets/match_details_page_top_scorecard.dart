import 'package:flutter/material.dart';
import 'package:predox_website/core/models/match_model.dart';


class TopScorecardWidget extends StatelessWidget {
  final MatchModel match;
  const TopScorecardWidget({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 150,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "• ${match.season}",
                  style: TextStyle(
                      color: Color(0xFFDCF763),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(width: 30),
                Text("• ${match.venue}",
                    style: TextStyle(
                        color: Color(0xFFDCF763),
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
            SizedBox(height: 12),
            // Top row: season, venue and date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //team a
                _teamColumn(match.teamA.name, match.teamA.logoUrl),
                SizedBox(
                  width: 8,
                ),

                //score
                _scoreColumn(
                    match.inningsList.isNotEmpty
                        ? '${match.inningsList[0].score.runs}/${match.inningsList[0].score.wickets} (${match.inningsList[0].score.overs})'
                        : "Yet To Bat",
                    "innings 1"),
                SizedBox(width: 8),

                // Match Icon
                Icon(Icons.sports_cricket, color: Colors.white, size: 24),

                SizedBox(width: 8),

                // Score B
                _scoreColumn(
                    match.inningsList.length > 1
                        ? '${match.inningsList[1].score.runs}/${match.inningsList[1].score.wickets} (${match.inningsList[1].score.overs})'
                        : "Yet to bat",
                    "Innings 2"),

                SizedBox(width: 8),
                // Team B
                _teamColumn(match.teamB.name, match.teamB.logoUrl),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _teamColumn(String name, String logo) {
  return Column(
    children: [
      ClipOval(
          child: Image.asset(
        logo,
        width: 36,
        height: 36,
        fit: BoxFit.cover,
      )),
      SizedBox(height: 4),
      Text(name, style: TextStyle(color: Color(0xFFDCF763), fontSize: 16)),
    ],
  );
}

Widget _scoreColumn(String score, String label) {
  return Column(
    children: [
      Text(
        score,
        style: TextStyle(color: Color(0xFFDCF763), fontWeight: FontWeight.bold),
      ),
      Text(label, style: TextStyle(color: Color(0xFFDCF763), fontSize: 12)),
    ],
  );
}
