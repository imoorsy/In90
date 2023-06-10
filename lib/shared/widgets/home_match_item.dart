import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:in90/layout/cubit/cubit.dart';
import 'package:in90/modules/match_page/match_page.dart';
import 'package:in90/shared/componants/componants.dart';

Widget buildMatchHomeItem(context, model) => InkWell(
      splashColor: Colors.green[900],
      onTap: () {
        SportCubit.get(context).getMatch(model.fixture!.id!);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MatchScreen()));
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: NetworkImage('${model.league!.logo}'),
              opacity: 0.1,
              alignment: const Alignment(0.9, 0),
              fit: BoxFit.contain,
              colorFilter: greyscale,
              centerSlice: Rect.largest),
          color: Colors.green[700]!.withOpacity(0.8),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    model.teams!.home!.name!,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CachedNetworkImage(
                  imageUrl: model.teams!.home!.logo!,
                  width: 45,
                  height: 45,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: BuildCondition(
              condition: model.fixture!.status!.short == '1H' ||
                  model.fixture!.status!.short == '2H' ||
                  model.fixture!.status!.short == 'ET',
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.goals!.home == null
                        ? '0'
                        : model.goals!.home.toString(),
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
                        '${model.fixture!.status!.elapsed}\'',
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
                      model.goals!.away == null
                          ? '0'
                          : model.goals!.away.toString(),
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
              fallback: (context) => BuildCondition(
                condition: model.fixture!.status!.short == 'FT',
                builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'FT',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    if(model.score!.penalty.home == null && model.score!.penalty.away == null)
                      const SizedBox(
                        height: 10,
                      ),
                    if(model.score!.penalty.home != null && model.score!.penalty.away != null)
                      Text(
                        '(${model.score!.penalty.home} - ${model.score!.penalty.away})',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    Text(
                      '${model.score!.fulltime.home} : ${model.score!.fulltime!.away} ',
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                fallback: (context) => BuildCondition(
                  condition: model.fixture!.status!.short == 'NS',
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        editMatchTime(
                            DateTime.parse(model.fixture!.date!).toLocal().hour,
                            DateTime.parse(model.fixture!.date!)
                                .toLocal()
                                .minute),
                        style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ],
                  ),
                  fallback: (context) => BuildCondition(
                    condition: model.fixture!.status!.short == 'HT',
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              model.score!.halftime!.home == null
                                  ? '0'
                                  : model.score!.halftime.home.toString(),
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
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
                                  '${model.fixture!.status!.elapsed}\'',
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
                              model.score!.halftime!.away == null
                                  ? '0'
                                  : model.score!.halftime.away.toString(),
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    fallback: (context) => BuildCondition(
                      condition: model.fixture!.status!.short == 'BT',
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
                                model.goals!.home == null
                                    ? '0'
                                    : model.goals!.home.toString(),
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: model.teams!.home!.winner!
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
                                    '${model.fixture!.status!.elapsed}\'',
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
                                model.goals!.away == null
                                    ? '0'
                                    : model.goals!.away.toString(),
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: model.teams!.away!.winner!
                                        ? Colors.green
                                        : Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                      fallback: (context) => BuildCondition(
                        condition: model.fixture!.status!.short == 'PST',
                        builder: (context) => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  'PST',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        fallback: (context) => BuildCondition(
                          condition: model.fixture!.status!.short == 'FT',
                          builder: (context) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'FT',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              if(model.score!.penalty.home == null && model.score!.penalty.away == null)
                                const SizedBox(
                                  height: 10,
                                ),
                              if(model.score!.penalty.home != null && model.score!.penalty.away != null)
                                Text(
                                  '(${model.score!.penalty.home} - ${model.score!.penalty.away})',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              Text(
                                '${model.score!.fulltime.home} : ${model.score!.fulltime!.away} ',
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          fallback: (context) => BuildCondition(
                            condition: model.fixture!.status!.short == 'AET',
                            builder: (context) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'ET',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                if(model.score!.penalty.home == null && model.score!.penalty.away == null)
                                  const SizedBox(
                                    height: 10,
                                  ),
                                if(model.score!.penalty.home != null && model.score!.penalty.away != null)
                                  Text(
                                    '(${model.score!.penalty.home} - ${model.score!.penalty.away})',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                Text(
                                  '${model.score!.fulltime.home} : ${model.score!.fulltime!.away} ',
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            fallback: (context) => BuildCondition(
                              condition: model.fixture!.status!.short == 'PEN',
                              builder: (context) => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pens',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  if(model.score!.penalty.home == null && model.score!.penalty.away == null)
                                    const SizedBox(
                                      height: 10,
                                    ),

                                  Text(
                                    '${model.score!.fulltime.home} : ${model.score!.fulltime!.away} ',
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  if(model.score!.penalty.home != null && model.score!.penalty.away != null)
                                    Text(
                                      '(${model.score!.penalty.home} - ${model.score!.penalty.away})',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                ],
                              ),
                              fallback: (context) => const Center(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  imageUrl: model.teams!.away!.logo!,
                  width: 45,
                  height: 45,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Text(
                    model.teams!.away!.name!,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );

const ColorFilter greyscale = ColorFilter.matrix(<double>[
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
