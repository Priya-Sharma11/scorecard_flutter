import 'package:flutter/material.dart';
import 'package:predox_website/core/provider/match_provider.dart';
import 'package:provider/provider.dart';

class SquadTabWidget extends StatelessWidget {
  const SquadTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MatchProvider>(
      builder: (context, matchProvider, _) {
        final match = matchProvider.selectedMatch;

        if (match == null) {
          return const Scaffold(
            body: Center(child: Text('Match not found')),
          );
        }

        final teamA = match.teamA.playing11;
        final teamB = match.teamB.playing11;
        final maxLength =
            teamA.length > teamB.length ? teamA.length : teamB.length;

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //  team logos and names
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTeamHeader(match.teamA.logoUrl, match.teamA.name),
                      const SizedBox(width: 16),
                      _buildTeamHeader(match.teamB.logoUrl, match.teamB.name),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // players Card
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: List.generate(maxLength, (i) {
                          final playerA = i < teamA.length ? teamA[i] : null;
                          final playerB = i < teamB.length ? teamB[i] : null;

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _buildPlayerInfo(playerA),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildPlayerInfo(playerB),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTeamHeader(String logoUrl, String teamName) {
    return Expanded(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(logoUrl, height: 30),
          ),
          const SizedBox(height: 6),
          Text(
            teamName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerInfo(dynamic player) {
    if (player == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          player.name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          player.role,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
