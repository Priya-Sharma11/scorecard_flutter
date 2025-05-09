import 'package:flutter/material.dart';
import 'package:predox_website/core/provider/match_provider.dart';
import 'package:predox_website/features/home/presentation/widgets/home_scorecard_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final matchProvider = context.watch<MatchProvider>();
    final sortedMatches = matchProvider.sortedMatches;

    return Scaffold(
      appBar: AppBar(
        title: Text('ScoreCard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // for screens wider than 600px
            if (constraints.maxWidth > 600) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: sortedMatches.map((match) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: 220, // smaller card size for large screens
                        child: ScoreCardWidget(match: match),
                      ),
                    );
                  }).toList(),
                ),
              );
            } else {
              // for smaller screens: horizontal scroll with default size
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: sortedMatches.map((match) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: 300, // default size for smaller screens
                        child: ScoreCardWidget(match: match),
                      ),
                    );
                  }).toList(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
