import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in90/layout/cubit/states.dart';
import 'package:in90/models/head_to_head_model.dart';
import 'package:in90/models/home_match_model.dart';
import 'package:in90/models/league_position_model.dart';
import 'package:in90/models/player_model.dart';
import 'package:in90/models/single_match_model.dart';
import 'package:in90/models/teams_search_model.dart';
import 'package:in90/modules/layout_screens/Standings_screen/standings_screen.dart';
import 'package:in90/modules/layout_screens/all_competitions_screen/all_competitions_screen.dart';
import 'package:in90/modules/layout_screens/home_screen/home_screen.dart';
import 'package:in90/modules/layout_screens/user_screen/user_screen.dart';
import 'package:in90/shared/componants/constants.dart';
import 'package:in90/shared/network/remote/dio_helper.dart';

class SportCubit extends Cubit<SportStates> {
  SportCubit() : super(InitialSportState());

  static SportCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex (index) {
    currentIndex = index;
    emit(ChangeNavSportState());
    if(index == 1){
      getLeaguesStanding(2022);
    }
  }

  List<Widget> screens = [
    const HomeScreen(),
    StandingsScreen(),
    const AllCompetitionsScreen(),
    const UserScreen(),
  ];

  HomeMatchModel? homeMatchModel;
  List<HomeResponse> worldCupMatches = [],
      WorldCupQualificationEurope = [],
      WorldCupQualificationAfrica = [],
      WorldCupQualificationAsia = [],
      WorldCupQualificationCONCACAF = [],
      WorldCupQualificationOceania = [],
      WorldCupQualificationSouthAmerica = [],
      UCLMatches = [],
      UEFAEuropaLeagueMatches = [],
      UEFAEuropaConferenceLeague = [],
      UEFASuperCup = [],
      EuroMatches = [],
      AfricaCupofNations = [],
      AfricaCupofNationsQualification = [],
      AfricanNationsChampionship = [],
      CAFChampionsLeagueMatches = [],
      CAFConfederationCupMatches = [],
      CAFSuperCup = [],
      FIFAClubWorldCupMatches = [],
      EnglandLeague = [],
      England2League = [],
      EnglandFACup = [],
      EnglandEFLCup = [],
      ItalianLeague = [],
      ItalianCup = [],
      SpanishLeague = [],
      SpanishCup = [],
      FranceLeague = [],
      France2League = [],
      FranceCup = [],
      GermanLeague = [],
      GermanDFBPokalCup = [],
      EnglandSuperCup = [],
      SpanishSuperCup = [],
      ItalianSuperCup = [],
      FranceSuperCup = [],
      GermanSuperCup = [],
      EgyptionLeague = [],
      EgyptionCup = [],
      EgyptionSuperCup = [],
      EgyptionElrabtaCup = [],
      AFCChampionsLeague = [],
      SaudiLeague = [],
      Saudi2League = [],
      QatarStarsLeague = [],
      QatarQSLCup= [],
      QatarEmirCup = [],
      QatarQatarCup= [],
      QatarQFACup= [],
      EuroChampionshipQualification = [],
      FriendliesMatch = [],
      FriendliesClubMatch = [],
      MoroccoLeague = [],
      MoroccoCup = [],
      TurkishLeague = [],
      TurkishCup = [],
      TurkishSuperCup = [],
      AlgeriaLeague = [],
      AlgeriaCup = [],
      AlgeriaElrabtaCup = [],
      AlgeriaSuperCup = [],
      TunisiaLeague = [],
      TunisiaCup = [],
      JordanLeague = [],
      JordanCup = [],
      JordanSuperCup = [],
      IraqShieldCup = [],
      IraqLeague = [],
      PalestineLeague = [],
      SudanLeague = [];

  String selectedDate = editDateFormat(todayDate);

  Future<void> getMatchCenter({String? date}) async {
    emit(GetLoadingHomeDataSportState());
    selectedDate = date ?? selectedDate;
    homeMatchModel = null;
    DioHelper.getMatchData(url: 'fixtures', query: {
      'date': selectedDate,
    }).then((value) {
      homeMatchModel = HomeMatchModel.fromJson(value.data);
      worldCupMatches = [];
      WorldCupQualificationEurope = [];
      WorldCupQualificationAfrica = [];
      WorldCupQualificationAsia = [];
      WorldCupQualificationCONCACAF = [];
      WorldCupQualificationOceania = [];
      WorldCupQualificationSouthAmerica = [];
      UCLMatches = [];
      UEFAEuropaLeagueMatches = [];
      UEFAEuropaConferenceLeague = [];
      UEFASuperCup = [];
      EuroMatches = [];
      AfricaCupofNations = [];
      AfricaCupofNationsQualification = [];
      AfricanNationsChampionship = [];
      CAFChampionsLeagueMatches = [];
      CAFConfederationCupMatches = [];
      CAFSuperCup = [];
      FIFAClubWorldCupMatches = [];
      EnglandLeague = [];
      England2League = [];
      EnglandFACup = [];
      EnglandEFLCup = [];
      ItalianLeague = [];
      ItalianCup = [];
      SpanishLeague = [];
      SpanishCup = [];
      FranceLeague = [];
      France2League = [];
      FranceCup = [];
      GermanLeague = [];
      GermanDFBPokalCup = [];
      EnglandSuperCup = [];
      SpanishSuperCup = [];
      ItalianSuperCup = [];
      FranceSuperCup = [];
      GermanSuperCup = [];
      EgyptionLeague = [];
      AFCChampionsLeague = [];
      SaudiLeague = [];
      Saudi2League = [];
      EuroChampionshipQualification = [];
      FriendliesMatch = [];
      FriendliesClubMatch = [];
      MoroccoLeague = [];
      MoroccoCup = [];
      TurkishLeague = [];
      TurkishCup = [];
      TurkishSuperCup = [];
      IraqLeague = [];
      TunisiaLeague = [];
      TunisiaCup = [];
      SudanLeague = [];
      EgyptionCup = [];
      EgyptionSuperCup = [];
      EgyptionElrabtaCup = [];
      JordanLeague = [];
      JordanCup = [];
      JordanSuperCup = [];
      IraqShieldCup = [];
      PalestineLeague = [];
      AlgeriaLeague = [];
      AlgeriaCup = [];
      AlgeriaElrabtaCup = [];
      AlgeriaSuperCup = [];
      for (var element in homeMatchModel!.response!) {
        if (element.league!.id == 1) {
          worldCupMatches.add(element);
        } else if (element.league!.id == 2) {
          UCLMatches.add(element);
        } else if (element.league!.id == 3) {
          UEFAEuropaLeagueMatches.add(element);
        } else if (element.league!.id == 4) {
          EuroMatches.add(element);
        } else if (element.league!.id == 6) {
          AfricaCupofNations.add(element);
        } else if (element.league!.id == 10) {
          FriendliesMatch.add(element);
        } else if (element.league!.id == 667) {
          FriendliesClubMatch.add(element);
        } else if (element.league!.id == 12) {
          CAFChampionsLeagueMatches.add(element);
        } else if (element.league!.id == 15) {
          FIFAClubWorldCupMatches.add(element);
        } else if (element.league!.id == 17) {
          AFCChampionsLeague.add(element);
        } else if (element.league!.id == 19) {
          AfricanNationsChampionship.add(element);
        } else if (element.league!.id == 20) {
          CAFConfederationCupMatches.add(element);
        } else if (element.league!.id == 29) {
          WorldCupQualificationAfrica.add(element);
        } else if (element.league!.id == 30) {
          WorldCupQualificationAsia.add(element);
        } else if (element.league!.id == 31) {
          WorldCupQualificationCONCACAF.add(element);
        } else if (element.league!.id == 32) {
          WorldCupQualificationEurope.add(element);
        } else if (element.league!.id == 33) {
          WorldCupQualificationOceania.add(element);
        } else if (element.league!.id == 34) {
          WorldCupQualificationSouthAmerica.add(element);
        } else if (element.league!.id == 36) {
          AfricaCupofNationsQualification.add(element);
        } else if (element.league!.id == 39) {
          EnglandLeague.add(element);
        } else if (element.league!.id == 40) {
          England2League.add(element);
        } else if (element.league!.id == 45) {
          EnglandFACup.add(element);
        } else if (element.league!.id == 48) {
          EnglandEFLCup.add(element);
        } else if (element.league!.id == 61) {
          FranceLeague.add(element);
        } else if (element.league!.id == 62) {
          France2League.add(element);
        } else if (element.league!.id == 66) {
          FranceCup.add(element);
        } else if (element.league!.id == 78) {
          GermanLeague.add(element);
        } else if (element.league!.id == 81) {
          GermanDFBPokalCup.add(element);
        } else if (element.league!.id == 135) {
          ItalianLeague.add(element);
        } else if (element.league!.id == 137) {
          ItalianCup.add(element);
        } else if (element.league!.id == 848) {
          UEFAEuropaConferenceLeague.add(element);
        } else if (element.league!.id == 531) {
          UEFASuperCup.add(element);
        } else if (element.league!.id == 533) {
          CAFSuperCup.add(element);
        } else if (element.league!.id == 233) {
          EgyptionLeague.add(element);
        } else if (element.league!.id == 140) {
          SpanishLeague.add(element);
        } else if (element.league!.id == 143) {
          SpanishCup.add(element);
        } else if (element.league!.id == 307) {
          SaudiLeague.add(element);
        } else if (element.league!.id == 308) {
          Saudi2League.add(element);
        } else if (element.league!.id == 960) {
          EuroChampionshipQualification.add(element);
        } else if (element.league!.id == 960) {
          EuroChampionshipQualification.add(element);
        } else if (element.league!.id == 203) {
          TurkishLeague.add(element);
        } else if (element.league!.id == 200) {
          MoroccoLeague.add(element);
        } else if (element.league!.id == 822) {
          MoroccoCup.add(element);
        } else if (element.league!.id == 206) {
          TurkishCup.add(element);
        } else if (element.league!.id == 551) {
          TurkishSuperCup.add(element);
        } else if (element.league!.id == 542) {
          IraqLeague.add(element);
        } else if (element.league!.id == 402) {
          SudanLeague.add(element);
        } else if (element.league!.id == 714) {
          EgyptionCup.add(element);
        } else if (element.league!.id == 539) {
          EgyptionSuperCup.add(element);
        } else if (element.league!.id == 895) {
          EgyptionElrabtaCup.add(element);
        } else if (element.league!.id == 202) {
          TunisiaLeague.add(element);
        } else if (element.league!.id == 511) {
          TunisiaCup.add(element);
        } else if (element.league!.id == 186) {
          AlgeriaLeague.add(element);
        } else if (element.league!.id == 514) {
          AlgeriaCup.add(element);
        } else if (element.league!.id == 832) {
          AlgeriaElrabtaCup.add(element);
        } else if (element.league!.id == 516) {
          AlgeriaSuperCup.add(element);
        } else if (element.league!.id == 387) {
          JordanLeague.add(element);
        } else if (element.league!.id == 863) {
          JordanCup.add(element);
        } else if (element.league!.id == 838) {
          JordanSuperCup.add(element);
        } else if (element.league!.id == 816) {
          IraqShieldCup.add(element);
        } else if (element.league!.id == 586) {
          PalestineLeague.add(element);
        }
      }
      emit(GetSuccessHomeDataSportState());
    }).catchError((error) {
      emit(GetErrorHomeDataSportState());
    });
  }

  SingleMatchModel? currentMatch;
  LeaguePosition? leaguePosition;
  HeadToHead? headToHead;
  List<int> homeForm = [];
  List<int> awayForm = [];
  Future<void> getMatch(int id) async {
    emit(GetLoadingCrntMatchSportState());
    currentMatch = null;
    await DioHelper.getMatchData(url: 'fixtures', query: {
      'id': id,
    }).then((value) {
      currentMatch = SingleMatchModel.fromJson(value.data);
      homeForm = editStringList(currentMatch!.response!.first.lineups!.first.formation!.split('-'));
      awayForm = editStringList(currentMatch!.response!.first.lineups!.last.formation!.split('-'));
      emit(GetSuccessCrntMatchSportState());
    }).catchError((error) {
      emit(GetErrorCrntMatchSportState());
    });

    //League Positions

    if(currentMatch!.response!.first.league!.name!.contains('league')) {
      leaguePosition = null;
      await DioHelper.getMatchData(url: 'standings', query: {
        'league': currentMatch!.response!.first.league!.id,
        'season' : currentMatch!.response!.first.league!.season,
      }).then((value) {
        leaguePosition = LeaguePosition.fromJson(value.data);
      }).catchError((error) {
        emit(GetErrorCrntMatchSportState());
      });
    }

    // HeadToHead Matches
    headToHead = null;
    await DioHelper.getMatchData(url: 'fixtures/headtohead', query: {
      'h2h': '${currentMatch!.response!.first.teams!.home!.id!}-${currentMatch!.response!.first.teams!.away!.id!}',
      'last': 10,
    }).then((value) {
      headToHead = HeadToHead.fromJson(value.data);
      emit(GetSuccessCrntMatchSportState());
    }).catchError((error) {
      emit(GetErrorCrntMatchSportState());
    });
  }

  Future<void> getSelctedMatch() async {
    emit(GetLoadingCrntMatchSportState());
    int currentMatchId = currentMatch!.response!.first.fixture!.id!;
    currentMatch = null;
    await DioHelper.getMatchData(url: 'fixtures', query: {
      'id': currentMatchId,
    }).then((value) {
      currentMatch = SingleMatchModel.fromJson(value.data);
      homeForm = editStringList(currentMatch!.response!.first.lineups!.first.formation!.split('-'));
      awayForm = editStringList(currentMatch!.response!.first.lineups!.last.formation!.split('-'));
    }).catchError((error) {
      emit(GetErrorCrntMatchSportState());
    });

    //League Positions
    leaguePosition = null;
    await DioHelper.getMatchData(url: 'standings', query: {
      'league': currentMatch!.response!.first.league!.id,
      'season' : currentMatch!.response!.first.league!.season,
    }).then((value) {
      leaguePosition = LeaguePosition.fromJson(value.data);
    }).catchError((error) {
      emit(GetErrorCrntMatchSportState());
    });
    // HeadToHead Matches
    headToHead = null;
    await DioHelper.getMatchData(url: 'fixtures/headtohead', query: {
      'h2h': '${currentMatch!.response!.first.teams!.home!.id!}-${currentMatch!.response!.first.teams!.away!.id!}',
      'last': 10,
    }).then((value) {
      headToHead = HeadToHead.fromJson(value.data);
      emit(GetSuccessCrntMatchSportState());
    }).catchError((error) {
      emit(GetErrorCrntMatchSportState());
    });
  }

  PlayerModel? playerModel;
  Future<void> getPlayer(int id,int season) async {
    emit(GetLoadingCrntPlayerSportState());
    playerModel = null;
    await DioHelper.getMatchData(url: 'players', query: {
      'id': id,
      'season' : season,
    }).then((value) {
      playerModel = PlayerModel.fromJson(value.data);
      emit(GetSuccessCrntPlayerSportState());
    }).catchError((error) {
      emit(GetErrorCrntPlayerSportState());
    });
  }


  List<LeaguePosition> leaguesStandings = [];

  void getLeaguesStanding(int? season) async {
    emit(GetLoadingLeaguesStandingSportState());
    leaguesStandings.clear();
    await DioHelper.getMatchData(url: 'standings', query: {
      'league': 39,
      'season' : season,
    }).then((value) {
      leaguesStandings.add(LeaguePosition.fromJson(value.data));
    }).catchError((error) {
      emit(GetErrorLeaguesStandingSportState());
    });
    await DioHelper.getMatchData(url: 'standings', query: {
      'league': 140,
      'season' : season,
    }).then((value) {
      leaguesStandings.add(LeaguePosition.fromJson(value.data));
    }).catchError((error) {
      emit(GetErrorLeaguesStandingSportState());
    });
    await DioHelper.getMatchData(url: 'standings', query: {
      'league': 135,
      'season' : season,
    }).then((value) {
      leaguesStandings.add(LeaguePosition.fromJson(value.data));
    }).catchError((error) {
      emit(GetErrorLeaguesStandingSportState());
    });
    await DioHelper.getMatchData(url: 'standings', query: {
      'league': 78,
      'season' : season,
    }).then((value) {
      leaguesStandings.add(LeaguePosition.fromJson(value.data));
    }).catchError((error) {
      emit(GetErrorLeaguesStandingSportState());
    });
    await DioHelper.getMatchData(url: 'standings', query: {
      'league': 61,
      'season' : season,
    }).then((value) {
      leaguesStandings.add(LeaguePosition.fromJson(value.data));
    }).catchError((error) {
      emit(GetErrorLeaguesStandingSportState());
    });

    emit(GetSuccessLeaguesStandingSportState());
  }


  TeamsSearch? teamsSearch;
  void getTeamSearch(String search) async {
    emit(GetLoadingTeamsSearchSportState());
    teamsSearch = null;
    await DioHelper.getMatchData(url: 'teams', query: {
      'search' : search,
    }).then((value) {
      teamsSearch = TeamsSearch.fromJson(value.data);
      emit(GetSuccessTeamsSearchSportState());
    }).catchError((error) {
      emit(GetErrorTeamsSearchSportState());
    });
  }
}
