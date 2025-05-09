import 'package:flutter/material.dart';
import 'package:predox_website/core/models/player_model.dart';

class TeamSquadColumn extends StatelessWidget {
  final String teamName;
  final List<PlayerModel> players;
  final CrossAxisAlignment alignment;
  const TeamSquadColumn(
      {super.key,
      required this.players,
      required this.teamName,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    final leftColumnPlayers = players.take(players.length ~/ 2).toList();
    final rightColumnPlayers = players.skip(players.length ~/ 2).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  _buildPlayerColumn(context, leftColumnPlayers),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    width: 20,
                  ),
                  _buildPlayerColumn(context, rightColumnPlayers),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildPlayerColumn(BuildContext context, List<PlayerModel> players) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: players
          .asMap()
          .entries
          .map((entry) => _buildPlayerRow(entry.value, entry.key))
          .toList(),
    ),
  );
}

Widget _buildPlayerRow(PlayerModel player, int index) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    decoration: BoxDecoration(
      color: index % 2 == 0 ? Colors.grey[100] : Colors.grey[200],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFFDCF763),
          child: Text(
            player.name.isNotEmpty ? player.name[0] : "",
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                player.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                player.role,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
