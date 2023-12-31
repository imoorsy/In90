import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in90/layout/cubit/cubit.dart';
import 'package:in90/layout/cubit/states.dart';
import 'package:in90/modules/match_page_tabs/tab_details_page/tab_details_page.dart';
import 'package:in90/modules/match_page_tabs/tab_event_page/tab_event_page.dart';
import 'package:in90/modules/match_page_tabs/tab_h2h_page/tab_h2h_page.dart';
import 'package:in90/modules/match_page_tabs/tab_lienups_page/tab_lienups_page.dart';
import 'package:in90/modules/match_page_tabs/tab_position_page/tab_position_page.dart';
import 'package:in90/modules/match_page_tabs/tab_statictics_page/tab_statictics_page.dart';
import 'package:in90/shared/componants/componants.dart';


class MatchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportCubit, SportStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SportCubit cubit = SportCubit.get(context);
        return DefaultTabController(
          length: cubit.currentMatch != null ? cubit.currentMatch!.response!.first.league!.name!.contains('Cup') ? 5 : 6 : 6,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  statusBarColor: Colors.green[700]),
              toolbarHeight: 270,
              leading: const Text(''),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                ),
                child: BuildCondition(
                  condition: cubit.currentMatch != null,
                  builder: (context) => Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 35,
                              )),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sports_soccer,
                                size: 45,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Moccer',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold,),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.dark_mode,
                                color: Colors.black87,
                                size: 35,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: cubit.currentMatch!.response!.first.teams!.home!.logo!,
                                  width: 70,
                                  height: 70,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  cubit.currentMatch!.response!.first.teams!.home!
                                      .name!,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.timelapse,color: Colors.amber,),
                                    const SizedBox(width: 10,),
                                    Text(editMatchTime(DateTime.parse(cubit.currentMatch!.response!.first.fixture!.date!).hour, DateTime.parse(cubit.currentMatch!.response!.first.fixture!.date!).minute),
                                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                BuildCondition(
                                  condition: cubit.currentMatch!.response!.first.fixture!.status!.short == '1H' ||
                                      cubit.currentMatch!.response!.first.fixture!.status!.short == '2H' ||
                                      cubit.currentMatch!.response!.first.fixture!.status!.short == 'ET',
                                  builder: (context) => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        cubit.currentMatch!.response!.first.goals!.home == null
                                            ? '0'
                                            : cubit.currentMatch!.response!.first.goals!.home.toString(),
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          const CircularProgressIndicator(
                                            value: 1,
                                            strokeWidth: 3,
                                          ),
                                          Text(
                                            '${cubit.currentMatch!.response!.first.fixture!.status!.elapsed}\'',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                          cubit.currentMatch!.response!.first.goals!.away == null
                                              ? '0'
                                              : cubit.currentMatch!.response!.first.goals!.away.toString(),
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  fallback: (context) => BuildCondition(
                                    condition: cubit.currentMatch!.response!.first.fixture!.status!.short == 'FT',
                                    builder: (context) => Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: Colors.black,
                                          child: const Text(
                                            'FT',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${cubit.currentMatch!.response!.first.goals!.home} : ${cubit.currentMatch!.response!.first.goals!.away}',
                                          style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    fallback: (context) => BuildCondition(
                                      condition: cubit.currentMatch!.response!.first.fixture!.status!.short == 'NS',
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            parseTimeInSec(DateTime.parse(cubit.currentMatch!.response!.first.fixture!.date!).difference(DateTime.now()).inMilliseconds),
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      fallback: (context) => BuildCondition(
                                        condition: cubit.currentMatch!.response!.first.fixture!.status!.short == 'HT',
                                        builder: (context) => Column(
                                          children: [
                                            Container(
                                              color: Colors.green[700],
                                              child: const Text(
                                                'HT',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  cubit.currentMatch!.response!.first.goals!.home == null
                                                      ? '0'
                                                      : cubit.currentMatch!.response!.first.goals!.home.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.redAccent),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    const CircularProgressIndicator(
                                                      value: 1,
                                                      strokeWidth: 3,
                                                    ),
                                                    Text(
                                                      '${cubit.currentMatch!.response!.first.fixture!.status!.elapsed}\'',
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  cubit.currentMatch!.response!.first.goals!.away == null
                                                      ? '0'
                                                      : cubit.currentMatch!.response!.first.goals!.away.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.green),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        fallback: (context) => BuildCondition(
                                          condition: cubit.currentMatch!.response!.first.fixture!.status!.short == 'BT',
                                          builder: (context) => Column(
                                            children: [
                                              const Text(
                                                'ET Break',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.redAccent),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    cubit.currentMatch!.response!.first.goals!.home == null
                                                        ? '0'
                                                        : cubit.currentMatch!.response!.first.goals!.home.toString(),
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight: FontWeight.bold,
                                                        color: cubit.currentMatch!.response!.first.teams!.home!.winner!
                                                            ? Colors.green
                                                            : Colors.redAccent),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      const CircularProgressIndicator(
                                                        value: 1,
                                                        strokeWidth: 3,
                                                      ),
                                                      Text(
                                                        '${cubit.currentMatch!.response!.first.fixture!.status!.elapsed}\'',
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    cubit.currentMatch!.response!.first.goals!.away == null
                                                        ? '0'
                                                        : cubit.currentMatch!.response!.first.goals!.away.toString(),
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight: FontWeight.bold,
                                                        color: cubit.currentMatch!.response!.first.teams!.away!.winner!
                                                            ? Colors.green
                                                            : Colors.red),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          fallback: (context) => BuildCondition(
                                            condition: cubit.currentMatch!.response!.first.fixture!.status!.short == 'PST',
                                            builder: (context) => Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                                                    decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius: BorderRadius.circular(20)
                                                    ),
                                                    child: const Text(
                                                      'مؤجل',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            fallback: (context) => const Center(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl : cubit.currentMatch!.response!.first.teams!.away!
                                      .logo!,
                                  width: 70,
                                  height: 70,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  cubit.currentMatch!.response!.first.teams!.away!
                                      .name!,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  fallback: (context) => Container(
                    height: 300,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          height: 80,
                          color: Colors.white54,
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          height: 80,
                          color: Colors.white54,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                indicatorWeight: cubit.currentMatch != null ? cubit.currentMatch!.response!.first.league!.name!.contains('Cup') ? 5 : 6 : 6,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.white,
                  tabs: [
                const Tab(text: 'Details',),
                const Tab(text: 'Events',),
                const Tab(text: 'Substitute',),
                const Tab(text: 'Statictics',),
                const Tab(text: 'H2H',),
                if(cubit.currentMatch != null)
                  if(!cubit.currentMatch!.response!.first.league!.name!.contains('Cup'))
                    const Tab(text: 'Position',),
              ]),
            ),
            body: BuildCondition(
              condition: cubit.currentMatch != null,
              builder: (context) => TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                const TabDetailsScreen(),
                const TabEventScreen(),
                const TabLienupsScreen(),
                const TabStatisticsScreen(),
                TabHToHScreen(),
                if(!cubit.currentMatch!.response!.first.league!.name!.contains('Cup'))
                  const TabPositionScreen(),
              ],),
              fallback: (context) => SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 80,
                      color: Colors.grey[300]!.withOpacity(0.5),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 80,
                      color: Colors.grey[300]!.withOpacity(0.5),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 80,
                      color: Colors.grey[300]!.withOpacity(0.5),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 80,
                      color: Colors.grey[300]!.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
