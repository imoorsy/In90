import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in90/layout/cubit/cubit.dart';
import 'package:in90/layout/cubit/states.dart';

class AllCompetitionsScreen extends StatelessWidget {
  const AllCompetitionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportCubit,SportStates>(
      listener: (context,state) {},
      builder: (context,state) => Center(child: Text('Comps')),);
  }
}
