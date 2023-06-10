import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in90/layout/cubit/cubit.dart';
import 'package:in90/layout/cubit/states.dart';
import 'package:in90/shared/widgets/home_match_item.dart';


class TabHToHScreen extends StatelessWidget {

  ColorFilter greyscale = const ColorFilter.matrix(<double>[
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0,      0,      0,      1.5, 0,
  ]);

  TabHToHScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportCubit, SportStates>(
        builder: (context, state) {
          SportCubit cubit = SportCubit.get(context);
          return BuildCondition(
            condition: cubit.headToHead != null,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) => buildMatchH2H(context,cubit.headToHead!.response![index]),
                separatorBuilder: (context, index)=> const SizedBox(height: 10,),
                itemCount: cubit.headToHead!.response!.length),
            fallback: (context) => const Center(child: Text('No Bast Matches')),
          );
        },
        listener: (context, state) {});
  }

  Widget buildMatchH2H(context,model) => Column(
    children: [
      Text('${DateTime.parse(model.fixture!.date!).year.toString()}-${DateTime.parse(model.fixture!.date!).month.toString()}-${DateTime.parse(model.fixture!.date!).day.toString()}',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      ),
      buildMatchHomeItem(context, model),
    ],
  );


}
