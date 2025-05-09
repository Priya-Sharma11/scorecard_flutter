import 'package:flutter/material.dart';
import 'package:predox_website/core/provider/match_provider.dart';
import 'package:predox_website/features/home/presentation/widgets/match_details_bottom_section_widget.dart';
import 'package:predox_website/features/home/presentation/widgets/match_details_page_top_scorecard.dart';

import 'package:provider/provider.dart';

class MatchDetailsPage extends StatefulWidget {
  final String matchId;
  final String matchName;
  final String season;

  const MatchDetailsPage(
      {super.key,
      required this.matchId,
      required this.matchName,
      required this.season});

  @override
  State<MatchDetailsPage> createState() => _MatchDetailsPageState();
}

class _MatchDetailsPageState extends State<MatchDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedTab = 0;
  final int tabCount = 5;

  @override
  void initState() {
    super.initState();
    final matchProvider = Provider.of<MatchProvider>(context, listen: false);
    matchProvider.fetchedMatchById(widget.matchId);

    _tabController = TabController(length: tabCount, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          selectedTab = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MatchProvider>(builder: (context, matchProvider, _) {
      if (matchProvider.isLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      final match = matchProvider.selectedMatch;

      if (match == null) {
        return const Scaffold(
          body: Center(
            child: Text('Match not found'),
          ),
        );
      }
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 50.0 ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TopScorecardWidget(
                  match: match,
                ),
                const SizedBox(height: 20),
                MatchDetailsBottomSectionWidget(controller: _tabController),
              ],
            ),
          ),
        ),
      );
    });
  }
}
