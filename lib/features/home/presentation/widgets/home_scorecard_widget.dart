import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:predox_website/core/models/match_model.dart';
import 'package:predox_website/features/home/presentation/widgets/blinking_live_badge_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  final MatchModel match;

  const ScoreCardWidget({super.key, required this.match});

  bool get isLive => match.type == MatchType.live;
  bool get isUpcoming => match.type == MatchType.upcoming;
  bool get isCompleted => match.type == MatchType.completed;

  String matchStatusText() {
    if (isLive) {
      //  score from inning
      if (match.inningsList.isNotEmpty) {
        final innings = match.inningsList.last;
        final score = innings.score;
        return '${score.runs}/${score.wickets} (${score.overs} ov)';
      }
      return 'Match in progress';
    } else {
      final duration = match.matchDateTime.difference(DateTime.now());
      if (isCompleted) {
        return match.liveSummary.isNotEmpty ? match.liveSummary : 'Match Ended';
      } else if (duration.isNegative) {
        return match.liveStatus.isNotEmpty ? match.liveStatus : 'Match Ended';
      } else if (duration.inHours < 1) {
        return 'Match Starts in ${duration.inMinutes} min';
      } else {
        return 'Match Starts in ${duration.inHours} hr';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(
          '/match/${match.id}/${Uri.encodeComponent('${match.teamA.name}_vs_${match.teamB.name}')}/${match.season}',
          extra: match,
        );
      },
      child: SizedBox(
        width: 180,
        height: 220,
        child: Card(
          color: const Color(0xFFF8FFF3),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.grey, width: 1.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //season and match status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '• ${match.season}',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    matchTypeBadge(),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                //team logo and name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _teamInfo(match.teamA.logoUrl, match.teamA.name),
                    const Icon(Icons.sports_cricket, color: Colors.grey),
                    _teamInfo(match.teamB.logoUrl, match.teamB.name),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //score or time
                Center(
                  child: Text(
                    matchStatusText(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isLive ? const Color(0xFF7DA827) : Colors.black87,
                    ),
                  ),
                ),
                const Spacer(),
                //venue
                Center(
                  child: Text(
                    match.venue,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget matchTypeBadge() {
    if (isLive) {
      return const BlinkingLiveBadgeWidget();
    }
    String text = isUpcoming ? 'UPCOMING' : 'Match Ended';
    Color bgColor = isUpcoming ? const Color(0xffDCF763) : Colors.grey.shade300;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _teamInfo(String logoUrl, String name) {
    return Column(
      children: [
        Image.network(logoUrl, height: 36, width: 36),
        const SizedBox(height: 4),
        SizedBox(
          width: 72,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
