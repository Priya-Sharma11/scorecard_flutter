import 'package:flutter/material.dart';
import 'package:predox_website/features/home/presentation/widgets/match_info_tab_widget.dart';
import 'package:predox_website/features/home/presentation/widgets/scorecard_tab_screen_details.dart';
import 'package:predox_website/features/home/presentation/widgets/squad_tab_widget.dart';
import 'package:predox_website/utils/widgets/tab_widget.dart';

class MatchDetailsBottomSectionWidget extends StatefulWidget {
  final TabController controller;
  const MatchDetailsBottomSectionWidget({super.key, required this.controller});

  @override
  State<MatchDetailsBottomSectionWidget> createState() =>
      _MatchDetailsBottomSectionWidgetState();
}

class _MatchDetailsBottomSectionWidgetState
    extends State<MatchDetailsBottomSectionWidget> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        selectedIndex = widget.controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TabBar(
                controller: widget.controller,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFDCF763),
                ),
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                dividerColor: Colors.transparent,
                labelColor: Colors.black,
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.grey,
                isScrollable: true, // To allow space between tabs
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                tabs: [
                  TabWidget(
                      label: "Match Info", isSelected: selectedIndex == 0),
                  TabWidget(label: "Live", isSelected: selectedIndex == 1),
                  TabWidget(
                      label: "Score Card", isSelected: selectedIndex == 2),
                  TabWidget(
                      label: "Live Commentary", isSelected: selectedIndex == 3),
                  TabWidget(label: "Squads", isSelected: selectedIndex == 4),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 600,
          child: TabBarView(
            controller: widget.controller,
            children: const [
              MatchInfoTabWidget(),
              Center(child: Text("Live Details")),
              ScorecardTabScreenDetails(),
              Center(child: Text("Live Commentary Details")),
              SquadTabWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildTab(String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      /* color: Colors.grey[200], */
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label,
      style: const TextStyle(fontSize: 12),
    ),
  );
}
