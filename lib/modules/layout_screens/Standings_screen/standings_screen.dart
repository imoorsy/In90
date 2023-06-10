import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in90/layout/cubit/cubit.dart';
import 'package:in90/layout/cubit/states.dart';
import 'package:in90/models/league_position_model.dart';

class StandingsScreen extends StatelessWidget {
  StandingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportCubit, SportStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SportCubit cubit = SportCubit.get(context);
        return BuildCondition(
          condition: cubit.leaguesStandings != [],
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>
                buildLeagueStandingSmall(cubit.leaguesStandings[index]),
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            itemCount: cubit.leaguesStandings.length,
          ),
          fallback: (context) => const Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          )),
        );
      },
    );
  }

  Widget buildLeagueStandingSmall(LeaguePosition leagueStanding) => Column(
        children: [
          Row(
            children: [
              Image.network(
                leagueStanding.response!.first.league!.logo!,
                fit: BoxFit.contain,
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                leagueStanding.response!.first.league!.name!,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image:
                    NetworkImage(leagueStanding.response!.first.league!.logo!),
                opacity: 0.1,
                alignment: const Alignment(0.9, 0),
                fit: BoxFit.contain,
                colorFilter: greyscale,
                centerSlice: Rect.zero
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: DataTable(
                  columnSpacing: 15,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'rank',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'logo',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black54),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black54),
                      ),
                    ),
                    DataColumn(
                      label: Text('Played'),
                    ),
                    DataColumn(
                      label: Text(
                        'points',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                  rows: leagueStanding.response!.first.league!.standings!
                      .map(
                        (item) => DataRow(
                            cells: [
                          DataCell(Text(item.rank.toString())),
                          DataCell(CachedNetworkImage(
                            imageUrl: item.team!.logo!,
                            width: 30,
                            height: 30,
                          )),
                          DataCell(Text(
                            item.team!.name!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          )),
                          DataCell(Text(item.all!.played.toString())),
                          DataCell(Text(
                            item.points.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.green[900]),
                          ),),
                        ]),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      );

  Widget editTeamForm(String form) => Row(
        children: [
          for (int i = 0; i < form.length; i++)
            BuildCondition(
              condition: form[i] == 'W',
              builder: (context) => Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: const Text(
                    'W',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              fallback: (context) => BuildCondition(
                condition: form[i] == 'D',
                builder: (context) => Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: const Text(
                      'D',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                fallback: (context) => Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: const Text(
                      'L',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
        ],
      );

  ColorFilter greyscale = const ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1.5,
    0,
  ]);
}
