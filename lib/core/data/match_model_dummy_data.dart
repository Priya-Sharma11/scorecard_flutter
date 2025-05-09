import 'package:predox_website/core/data/player_model_dummy_data.dart';
import 'package:predox_website/core/models/commentary_model.dart';
import 'package:predox_website/core/models/innings_model.dart';
import 'package:predox_website/core/models/match_model.dart';
import 'package:predox_website/core/models/score_model.dart';
import 'package:predox_website/core/models/team_model.dart';

List<MatchModel> dummyMatches = [
  // Match 1
  MatchModel(
    id: "m1",
    teamA: TeamModel(
      id: "t1",
      name: "India",
      logoUrl: "assets/india.jpg",
      playing11: [
        ...indiaBatsmen,
        ...indiaAllRounders,
        ...indiaBowlers
      ],
      yetToBat: [
        
      ],
    ),
    teamB: TeamModel(
      id: "t2",
      name: "Australia",
      logoUrl: "assets/aus.jpeg",
      playing11: [
        ...australiaBatsmen,
        ...australiaAllRounders,
        ...australiaBowlers
      ],
      yetToBat: [],
    ),
    inningsList: [
      InningsModel(
        number: 1,
        battingTeam: TeamModel(
          id: "t1",
          name: "India",
          logoUrl: "",
          playing11: [],
          yetToBat: [],
        ),
        bowlingTeam: TeamModel(
          id: "t2",
          name: "Australia",
          logoUrl: "",
          playing11: [],
          yetToBat: [],
        ),
        score: ScoreModel(
          runs: 58,
          wickets: 1,
          overs: 7,
          batters: [],
          bowlers: [],
          fallOfWickets: []
        )
      )
    
          ],
        
    liveCommentary: [
      CommentaryModel(time: DateTime.now(), message: "Rohit hits a boundary!"),
      CommentaryModel(time: DateTime.now(), message: "Wicket! Rohit departs."),
    ],
    venue: "Wankhede Stadium",
    season: "IPL 2025",
    matchDateTime: DateTime(2025, 5, 8, 19, 30),
    type: MatchType.live,
    isLive: true,
    liveStatus: '',
    liveSummary: '',
  ),

  // Match 2
  MatchModel(
    id: "m2",
    teamA: TeamModel(
      id: "t3",
      name: "England",
      logoUrl: "assets/england.jpg",
      playing11: [
        ...englandBatsmen,
        ...englandAllRounders,
        ...englandBowlers
      ],
      yetToBat: [],
    ),
    teamB: TeamModel(
      id: "t4",
      name: "Pakistan",
      logoUrl: "assets/pak.jpg",
      playing11: [
        ...pakistanBowlers,
        ...pakistanAllRounders,
        ...pakistanBowlers
      ],
      yetToBat: [],
    ),
    inningsList: [],
    liveCommentary: [],
    venue: "Lord's, London",
    season: "World Cup 2025",
    matchDateTime: DateTime(2025, 6, 12, 15, 0),
    /*  startTime: '15:0', */
    type: MatchType.upcoming,
    isLive: false,
    liveStatus: '',
    liveSummary: '',
  ),

  // Match 3
  MatchModel(
    id: "m3",
    teamA: TeamModel(
      id: "t5",
      name: "South Africa",
      logoUrl: "assets/southafrica.png",
      playing11: [],
      yetToBat: [],
    ),
    teamB: TeamModel(
      id: "t6",
      name: "New Zealand",
      logoUrl: "assets/nz.jpg",
      playing11: [],
      yetToBat: [],
    ),
    inningsList: [],
    liveCommentary: [],
    venue: "Newlands, Cape Town",
    season: "T20 Series",
    matchDateTime: DateTime(2025, 7, 3, 13, 30),
    /*  startTime: '13:30', */
    type: MatchType.upcoming,
    isLive: false,
    liveSummary: '',
    liveStatus: '',
  ),

  // Match 4
  MatchModel(
    id: "m4",
    teamA: TeamModel(
      id: "t7",
      name: "Sri Lanka",
      logoUrl: "assets/srilanka.jpg",
      playing11: [],
      yetToBat: [],
    ),
    teamB: TeamModel(
      id: "t8",
      name: "Bangladesh",
      logoUrl: "assets/srilanka.jpg",
      playing11: [],
      yetToBat: [],
    ),
    inningsList: [],
    liveCommentary: [],
    venue: "R. Premadasa Stadium",
    season: "Asia Cup 2025",
    matchDateTime: DateTime(2025, 8, 10, 18, 0),
    /*  startTime: '18:0', */
    type: MatchType.upcoming,
    isLive: false,
    liveStatus: '',
    liveSummary: '',
  ),

  // Match 5
  MatchModel(
    id: "m5",
    teamA: TeamModel(
      id: "t9",
      name: "West Indies",
      logoUrl: "assets/westIndies.jpeg",
      playing11: [],
      yetToBat: [],
    ),
    teamB: TeamModel(
      id: "t10",
      name: "Zimbabwe",
      logoUrl: "assets/zimbabwe.jpeg",
      playing11: [],
      yetToBat: [],
    ),
    inningsList: [],
    liveCommentary: [],
    venue: "Kensington Oval, Barbados",
    season: "Bilateral Series",
    matchDateTime: DateTime(2025, 9, 1, 16, 0),
    liveStatus: '',
    liveSummary: '',
    /*   startTime: '16:0', */
    type: MatchType.upcoming,
    isLive: false,
  ),
];
