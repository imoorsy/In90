import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in90/layout/cubit/cubit.dart';
import 'package:in90/layout/cubit/states.dart';
import 'package:in90/models/teams_search_model.dart';
import 'package:in90/shared/componants/componants.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportCubit, SportStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SportCubit cubit = SportCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 50,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.black,
                            )),
                        Expanded(
                          child: defaultSearchFormField(context,
                              controller: searchController,
                              keyboardtype: TextInputType.text,
                              validator: (value) {
                            if(value.isEmpty || value.length < 4){
                              return 'Search can\'t be less 4 char';
                            }
                            return null;
                              },
                              prefix: Icons.search,
                              labelText: 'Search for your team..',
                              onchange: (value) {
                            if (value.length > 3) {
                              cubit.getTeamSearch(value);
                            }
                          }),
                        ),
                      ],
                    ),
                  ),
                 BuildCondition(
                   condition: cubit.teamsSearch == null && state is GetLoadingTeamsSearchSportState,
                   builder: (context) => Center(child: CircularProgressIndicator(color: Colors.green[900],)),
                   fallback: (context) => BuildCondition(
                     condition: cubit.teamsSearch == null,
                     builder: (context) => Text('No Team Found',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.red[900]),),
                     fallback: (context) =>  Column(
                       children: [
                         Row(
                           children: [
                             const SizedBox(width: 20,),
                             Text('${cubit.teamsSearch!.results} team found',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                           ],
                         ),
                         const SizedBox(height: 10,),
                         ListView.separated(
                             physics: const NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             itemBuilder: (context, index) => buildTeamSearchItem(context,
                                 cubit.teamsSearch!.response![index]),
                             separatorBuilder: (context, index) => const SizedBox(
                               height: 10,
                             ),
                             itemCount: cubit.teamsSearch!.response!.length),
                       ],
                     ),
                   ),
                 ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildTeamSearchItem(context,Response team) => ListTile(
        leading: Container(
          padding: const EdgeInsets.all(5),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(50)),
          child: Image.network(team.team!.logo!, fit: BoxFit.contain),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              team.team!.name!,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              team.team!.country == null ? 'Unknown' : team.team!.country!,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_forward_ios),
          ],
        ),
        style: ListTileStyle.drawer,
        splashColor: Colors.green[700],
        minVerticalPadding: 20,
        onTap: () {
          // navigatorGoto(context, TeamS)
        },
      );
}
