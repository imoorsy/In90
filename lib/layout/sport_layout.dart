import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in90/layout/cubit/cubit.dart';
import 'package:in90/layout/cubit/states.dart';
import 'package:in90/modules/search_screen/search_screen.dart';
import 'package:in90/shared/componants/componants.dart';
import 'package:in90/shared/widgets/home_bottom_nav.dart';
import 'package:in90/shared/widgets/list_of_leagues.dart';

class SportLayout extends StatelessWidget {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  SportLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportCubit, SportStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SportCubit cubit = SportCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.green[700]),
            leading: Row(
              children: [
                IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 35,
                      color: Colors.black,
                    )),
                // IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.dark_mode,
                //       color: Colors.black,
                //       size: 35,
                //     )),
              ],
            ),
            toolbarHeight: 70,
            elevation: 0,
            title: Row(
              children: [
                Icon(
                  Icons.sports_soccer,
                  size: 45,
                  color: Colors.green[700],
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Moccer',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    size: 35,
                    color: Colors.green[700],
                  )),
              IconButton(
                  onPressed: () {
                    navigatorGoto(context,SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                    size: 35,
                    color: Colors.black,
                  )),
              if(cubit.currentIndex == 1)
                IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!.showBottomSheet((context) => buildListLeagues(context,cubit));
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 35,
                      color: Colors.green[700],
                    )),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          drawerScrimColor: Colors.green[700]!.withOpacity(0.3),
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sports_soccer,
                      size: 45,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Moccer',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  highlightColor: Colors.green[300]!.withOpacity(0.5),
                  child: ListTile(
                    iconColor: Colors.green[900],
                    leading: Icon(
                      Icons.sports_soccer,
                      size: 30,
                    ),
                    title: Text(
                      'League Info',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    print('League Info');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  highlightColor: Colors.green[300]!.withOpacity(0.5),
                  child: ListTile(
                    iconColor: Colors.green[900],
                    leading: Icon(
                      Icons.text_snippet,
                      size: 30,
                    ),
                    title: Text(
                      'Team Info',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    print('Team Info');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  highlightColor: Colors.green[300]!.withOpacity(0.5),
                  child: ListTile(
                    iconColor: Colors.green[900],
                    leading: Icon(
                      Icons.headset_mic,
                      size: 30,
                    ),
                    title: Text(
                      'Contact US',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    print('Contact US');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  highlightColor: Colors.green[300]!.withOpacity(0.5),
                  child: ListTile(
                    iconColor: Colors.green[900],
                    leading: Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    title: Text(
                      'Settings',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    print('Settings');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: buildHomeBottomNav(cubit),
        );
      },
    );
  }
}
