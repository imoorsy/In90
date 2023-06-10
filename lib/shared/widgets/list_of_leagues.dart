import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:in90/layout/cubit/cubit.dart';

Widget buildListLeagues(context,cubit) => ListView.separated(
    itemBuilder: (context,index) => buildLeagueSelect(cubit,index),
    separatorBuilder: (context,index) => SizedBox(height: 10,),
    itemCount: 5);

Widget buildLeagueSelect(SportCubit cubit,index) => Row(
  children: [
    CachedNetworkImage(imageUrl: cubit.homeMatchModel!.response![index].league!.logo!,fit: BoxFit.contain,),
  ],
);