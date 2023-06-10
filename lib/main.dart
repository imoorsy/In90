import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in90/layout/cubit/cubit.dart';
import 'package:in90/layout/cubit/states.dart';
import 'package:in90/layout/sport_layout.dart';
import 'package:in90/modules/onboarding_screen/onboarding_screen.dart';
import 'package:in90/shared/bloc_observer.dart';
import 'package:in90/shared/componants/constants.dart';
import 'package:in90/shared/network/local/cache_helper.dart';
import 'package:in90/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? onboarding = CacheHelper.getData(key: 'OnBoarding');
  Widget startwidget = OnBoardingScreen();

if(onboarding != null) {
  startwidget = SportLayout();
} else {
  startwidget = OnBoardingScreen();
}

  runApp(MyApp(startWidget: startwidget,));
}

class MyApp extends StatelessWidget {

  final Widget? startWidget;
  const MyApp({super.key, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SportCubit()..getMatchCenter(date: editDateFormat(todayDate)),
      child: BlocConsumer<SportCubit, SportStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: const TextTheme(
                titleLarge: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                bodyLarge: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                bodyMedium: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                bodySmall: TextStyle(
                  color: Colors.black,
                ),
              )
            ),
            home: startWidget,
          );
        },
      ),
    );
  }
}
