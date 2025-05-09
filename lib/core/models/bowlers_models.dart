class BowlerModel {
  final String name;
  final double overs;
  final int maidens;
  final int runsConceded;
  final int wickets;
    final double economyRate;
  final int wideBalls;
  final int noBalls;

  BowlerModel({
    required this.name,
    required this.overs,
    required this.maidens,
    required this.runsConceded,
    required this.wickets,
    required this.economyRate,
    required this.wideBalls,
    required this.noBalls,
  });
}
