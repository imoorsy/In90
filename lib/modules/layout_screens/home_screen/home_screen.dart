import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in90/layout/cubit/cubit.dart';
import 'package:in90/layout/cubit/states.dart';
import 'package:in90/shared/widgets/league_home_section.dart';
import 'package:intl/intl.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:in90/shared/componants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportCubit, SportStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SportCubit cubit = SportCubit.get(context);
        return RefreshIndicator(
          onRefresh: cubit.getMatchCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.green[700],
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.parse(cubit.selectedDate),
                                firstDate: DateTime.parse('2010-01-01'),
                                lastDate: DateTime.parse('2024-01-01'))
                            .then((value) {
                          cubit.getMatchCenter(
                              date: editDateFormatSlash(
                                  DateFormat.yMd().format(value!)));
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.green),
                          color: Colors.green[700]!.withOpacity(0.5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 40,
                              color: Colors.green[900],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              cubit.selectedDate,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: Colors.green[700],
                          onTap: () {
                            cubit.getMatchCenter(
                                date: editDateFormatSlash(DateFormat.yMd()
                                    .format(DateTime.parse(cubit.selectedDate)
                                        .subtract(const Duration(days: 3)))));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  DateFormat('EEEEE', 'en_US')
                                      .format(DateTime.parse(cubit.selectedDate)
                                          .subtract(const Duration(days: 3)))
                                      .substring(0, 3),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                                Text(
                                  '${DateTime.parse(cubit.selectedDate).subtract(const Duration(days: 3)).day}',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: Colors.green[700],
                          onTap: () {
                            cubit.getMatchCenter(
                                date: editDateFormatSlash(DateFormat.yMd()
                                    .format(DateTime.parse(cubit.selectedDate)
                                        .subtract(const Duration(days: 2)))));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  DateFormat('EEEEE', 'en_US')
                                      .format(DateTime.parse(cubit.selectedDate)
                                          .subtract(const Duration(days: 2)))
                                      .substring(0, 3),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                                Text(
                                  '${DateTime.parse(cubit.selectedDate).subtract(const Duration(days: 2)).day}',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: Colors.green[700],
                          onTap: () {
                            cubit.getMatchCenter(
                                date: editDateFormatSlash(DateFormat.yMd()
                                    .format(DateTime.parse(cubit.selectedDate)
                                        .subtract(const Duration(days: 1)))));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  DateFormat('EEEEE', 'en_US')
                                      .format(DateTime.parse(cubit.selectedDate)
                                          .subtract(const Duration(days: 1)))
                                      .substring(0, 3),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                                Text(
                                  '${DateTime.parse(cubit.selectedDate).subtract(const Duration(days: 1)).day}',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                DateFormat('EEEEE', 'en_US')
                                    .format(DateTime.parse(cubit.selectedDate))
                                    .substring(0, 3),
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Text(
                                '${DateTime.parse(cubit.selectedDate).day}',
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: Colors.green[700],
                          onTap: () {
                            cubit.getMatchCenter(
                                date: editDateFormatSlash(DateFormat.yMd()
                                    .format(DateTime.parse(cubit.selectedDate)
                                        .add(const Duration(days: 1)))));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  DateFormat('EEEEE', 'en_US')
                                      .format(DateTime.parse(cubit.selectedDate)
                                          .add(const Duration(days: 1)))
                                      .substring(0, 3),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                                Text(
                                  '${DateTime.parse(cubit.selectedDate).add(const Duration(days: 1)).day}',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: Colors.green[700],
                          onTap: () {
                            cubit.getMatchCenter(
                                date: editDateFormatSlash(DateFormat.yMd()
                                    .format(DateTime.parse(cubit.selectedDate)
                                        .add(const Duration(days: 2)))));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  DateFormat('EEEEE', 'en_US')
                                      .format(DateTime.parse(cubit.selectedDate)
                                          .add(const Duration(days: 2)))
                                      .substring(0, 3),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                                Text(
                                  '${DateTime.parse(cubit.selectedDate).add(const Duration(days: 2)).day}',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: Colors.green[700],
                          onTap: () {
                            cubit.getMatchCenter(
                                date: editDateFormatSlash(DateFormat.yMd()
                                    .format(DateTime.parse(cubit.selectedDate)
                                        .add(const Duration(days: 3)))));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  DateFormat('EEEEE', 'en_US')
                                      .format(DateTime.parse(cubit.selectedDate)
                                          .add(const Duration(days: 3)))
                                      .substring(0, 3),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                                Text(
                                  '${DateTime.parse(cubit.selectedDate).add(const Duration(days: 3)).day}',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                BuildCondition(
                  condition: cubit.homeMatchModel == null &&
                      state is! GetErrorHomeDataSportState,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.green[300]!.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                            separatorBuilder: (context, index) {
                              return const Center();
                            },
                            itemCount: 15)),
                  ),
                  fallback: (context) => BuildCondition(
                    condition: cubit.homeMatchModel == null &&
                        state is GetErrorHomeDataSportState,
                    builder: (context) => Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mood_bad,
                          size: 200,
                          color: Colors.green[700],
                        ),
                        const Text(
                          'Somthing Went Wrong',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          splashColor: Colors.green[700],
                          onTap: () {
                            cubit.getMatchCenter(
                                date: editDateFormat(todayDate));
                          },
                          child: Container(
                              color: Colors.grey.withOpacity(0.5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: const Text(
                                'try again',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.black),
                              )),
                        ),
                      ],
                    )),
                    fallback: (context) => RefreshIndicator(
                      onRefresh: cubit.getMatchCenter,
                      displacement: 100,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              if (cubit.worldCupMatches.isNotEmpty)
                                buildLeagueSectionHome(cubit.worldCupMatches),
                              if (cubit.WorldCupQualificationEurope.isNotEmpty)
                                buildLeagueSectionHome(
                                    cubit.WorldCupQualificationEurope),
                              if (cubit.WorldCupQualificationAfrica.isNotEmpty)
                                buildLeagueSectionHome(
                                    cubit.WorldCupQualificationAfrica),
                              if (cubit.WorldCupQualificationAsia.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.worldCupMatches,
                                ),
                              if (cubit
                                  .WorldCupQualificationSouthAmerica.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.WorldCupQualificationSouthAmerica,
                                ),
                              if (cubit
                                  .WorldCupQualificationCONCACAF.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.WorldCupQualificationCONCACAF,
                                ),
                              if (cubit.WorldCupQualificationOceania.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.WorldCupQualificationOceania,
                                ),
                              if (cubit.EuroMatches.isNotEmpty)
                                buildLeagueSectionHome(cubit.EuroMatches),
                              if (cubit
                                  .EuroChampionshipQualification.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.EuroChampionshipQualification,
                                ),
                              if (cubit.AfricaCupofNations.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.AfricaCupofNations,
                                ),
                              if (cubit
                                  .AfricaCupofNationsQualification.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.AfricaCupofNationsQualification,
                                ),
                              if (cubit.FIFAClubWorldCupMatches.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.FIFAClubWorldCupMatches,
                                ),
                              if (cubit.UCLMatches.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.UCLMatches,
                                ),
                              if (cubit.UEFAEuropaLeagueMatches.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.UEFAEuropaLeagueMatches,
                                ),
                              if (cubit.UEFAEuropaConferenceLeague.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.UEFAEuropaConferenceLeague,
                                ),
                              if (cubit.UEFASuperCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.UEFASuperCup),
                              if (cubit.EnglandLeague.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.EnglandLeague,
                                ),
                              if (cubit.EnglandFACup.isNotEmpty)
                                buildLeagueSectionHome(cubit.EnglandFACup),
                              if (cubit.EnglandEFLCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.EnglandEFLCup),
                              if (cubit.ItalianLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.ItalianLeague),
                              if (cubit.ItalianCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.ItalianCup),
                              if (cubit.SpanishLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.SpanishLeague),
                              if (cubit.SpanishCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.SpanishCup),
                              if (cubit.GermanLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.GermanLeague),
                              if (cubit.GermanDFBPokalCup.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.GermanDFBPokalCup,
                                ),
                              if (cubit.FranceLeague.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.FranceLeague,
                                ),
                              if (cubit.FranceCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.FranceCup),
                              if (cubit.CAFChampionsLeagueMatches.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.CAFChampionsLeagueMatches,
                                ),
                              if (cubit.CAFConfederationCupMatches.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.CAFConfederationCupMatches,
                                ),
                              if (cubit.AFCChampionsLeague.isNotEmpty)
                                buildLeagueSectionHome(
                                    cubit.AFCChampionsLeague),
                              if (cubit.EgyptionLeague.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.EgyptionLeague,
                                ),
                              if (cubit.SaudiLeague.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.SaudiLeague,
                                ),
                              if (cubit.EgyptionCup.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.EgyptionCup,
                                ),
                              if (cubit.EgyptionSuperCup.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.EgyptionSuperCup,
                                ),
                              if (cubit.EgyptionElrabtaCup.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.EgyptionElrabtaCup,
                                ),
                              if (cubit.MoroccoLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.MoroccoLeague),
                              if (cubit.MoroccoCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.MoroccoCup),
                              if (cubit.TurkishLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.TurkishLeague),
                              if (cubit.TurkishCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.TurkishCup),
                              if (cubit.TurkishSuperCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.TurkishSuperCup),
                              if (cubit.TunisiaLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.TunisiaLeague),
                              if (cubit.TunisiaCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.TunisiaCup),
                              if (cubit.AlgeriaLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.AlgeriaLeague),
                              if (cubit.AlgeriaCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.AlgeriaCup),
                              if (cubit.AlgeriaSuperCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.AlgeriaSuperCup),
                              if (cubit.AlgeriaElrabtaCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.AlgeriaElrabtaCup),
                              if (cubit.IraqLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.IraqLeague),
                              if (cubit.IraqShieldCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.IraqShieldCup),
                              if (cubit.JordanLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.JordanLeague),
                              if (cubit.JordanCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.JordanCup),
                              if (cubit.JordanSuperCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.JordanSuperCup),
                              if (cubit.SudanLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.SudanLeague),
                              if (cubit.PalestineLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.PalestineLeague),
                              if (cubit.QatarStarsLeague.isNotEmpty)
                                buildLeagueSectionHome(cubit.QatarStarsLeague),
                              if (cubit.QatarQSLCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.QatarQSLCup),
                              if (cubit.QatarEmirCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.QatarEmirCup),
                              if (cubit.QatarQatarCup.isNotEmpty)
                                buildLeagueSectionHome(cubit.QatarQatarCup),
                              if (cubit.QatarQFACup.isNotEmpty)
                                buildLeagueSectionHome(cubit.QatarQFACup),
                              if (cubit.AfricanNationsChampionship.isNotEmpty)
                                buildLeagueSectionHome(
                                  cubit.AfricanNationsChampionship,
                                ),
                              if (cubit.England2League.isNotEmpty)
                                buildLeagueSectionHome(cubit.England2League),
                              if (cubit.France2League.isNotEmpty)
                                buildLeagueSectionHome(cubit.France2League),
                              if (cubit.Saudi2League.isNotEmpty)
                                buildLeagueSectionHome(cubit.Saudi2League),
                              if (cubit.FriendliesMatch.isNotEmpty)
                                buildLeagueSectionHome(cubit.FriendliesMatch),
                              if (cubit.FriendliesClubMatch.isNotEmpty)
                                buildLeagueSectionHome(
                                    cubit.FriendliesClubMatch),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
