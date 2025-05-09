class BallDetailModel {
  final int ballNumber;
  final String batsman;
  final String bowler;
  final String result; // e.g., "4 runs", "Wicket", "1 run", "No ball", etc.
  final DateTime time;

  BallDetailModel({
    required this.ballNumber,
    required this.batsman,
    required this.bowler,
    required this.result,
    required this.time,
  });
}