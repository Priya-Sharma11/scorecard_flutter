import 'package:flutter/material.dart';
import 'package:predox_website/core/data/batter_dummy_data.dart';
import 'package:predox_website/core/data/bowler_dummy_data.dart';
import 'package:predox_website/core/data/wicket_dummy_data.dart';
import 'package:predox_website/core/models/batter_models.dart';
import 'package:predox_website/core/models/bowlers_models.dart';
import 'package:predox_website/core/models/wicket_model.dart';

class ScorecardTabScreenDetails extends StatelessWidget {
  const ScorecardTabScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTeamScorecard('India', indiaBatters, indiaBowlers,indiaWickets),
                    buildTeamScorecard(
                        'Australia', australiaBatters, australiaBowlers,australiaWickets),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildTeamScorecard(
    String teamName, List<BatterModel> batters, List<BowlerModel> bowlers,List<WicketModel> fallOfWickets) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 1000,
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(
            "$teamName ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          children: [
            // Batting Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*  const Text("Batters",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), */
                  const SizedBox(height: 8),

                  // Header row with grey background
                  Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          flex: 2,
                          child: Text("Batter",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(width: 96),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("R",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("B",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("4s",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("6s",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("SR",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  ...batters.map((batter) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(batter.name),
                            ),
                            const SizedBox(width: 96),
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(batter.runs.toString()),
                                  Text(batter.balls.toString()),
                                  Text(batter.fours.toString()),
                                  Text(batter.sixes.toString()),
                                  Text(batter.strikeRate.toStringAsFixed(1)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 24),
                ],
              ),
            ),

            // Bowling Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*  const Text("Bowlers",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), */
                  const SizedBox(height: 8),

                  // Header row with grey background
                  Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          flex: 2,
                          child: Text("Bowlers",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(width: 96),
                        Expanded(
                          flex: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("O",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("M",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("R",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("W",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Econ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("WD",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("NB",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  ...bowlers.map((bowler) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(bowler.name),
                            ),
                            const SizedBox(width: 96),
                            Expanded(
                              flex: 8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(bowler.overs.toStringAsFixed(1)),
                                  Text(bowler.maidens.toString()),
                                  Text(bowler.runsConceded.toString()),
                                  Text(bowler.wickets.toString()),
                                  Text(bowler.economyRate.toStringAsFixed(2)),
                                  Text(bowler.wideBalls.toString()),
                                  Text(bowler.noBalls.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
