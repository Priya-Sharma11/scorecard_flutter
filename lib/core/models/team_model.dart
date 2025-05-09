import 'package:predox_website/core/models/player_model.dart';

class TeamModel {
  final String id;
  final String name;
  final String logoUrl;
  final List<PlayerModel> playing11;
  final List<PlayerModel> yetToBat;

  TeamModel({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.playing11,
    required this.yetToBat,
  });
}