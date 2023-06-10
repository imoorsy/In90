import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:in90/models/home_match_model.dart';
import 'package:in90/shared/widgets/home_match_item.dart';

Widget buildLeagueSectionHome(List<HomeResponse> matchesList) =>
    Column(
      children: [
        SizedBox(height: 10,),
        InkWell(
          splashColor: Colors.grey[500],
          onTap: () {
            print('tab');
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: matchesList.first.league!.logo!,
                height: 40,
                width: 40,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                matchesList.first.league!.name!,
                style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                buildMatchHomeItem(context, matchesList[index]),
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            itemCount: matchesList.length),
      ],
    );