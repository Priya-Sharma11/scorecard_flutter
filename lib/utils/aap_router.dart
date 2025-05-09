import 'package:go_router/go_router.dart';
import 'package:predox_website/features/home/presentation/pages/home_page.dart';
import 'package:predox_website/features/home/presentation/pages/match_details_page.dart';


class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(
        path: '/match/:matchId/:matchName/:season',
        builder: (context, state) {
          final matchId = state.pathParameters['matchId']!;
          final matchName = state.pathParameters['matchName']!;
          final season = state.pathParameters['season']!;
          return MatchDetailsPage(
            matchId: matchId,
            matchName: matchName,
            season: season,
            
          );
        })
  ]);
}
