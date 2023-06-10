import 'package:flutter/material.dart';
import 'package:in90/layout/sport_layout.dart';
import 'package:in90/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Board {
  String image;
  String title;
  String caption;
  String action;

  Board({
    required this.image,
    required this.title,
    required this.caption,
    required this.action,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;
  
  
  List<Board> boarding = [
    Board(
      image: 'assets/image/icon.png',
      title: 'Welcome In90 ->',
      caption:
          'In90 to follow the latest hot matches and follow the news of teams and players.',
      action: 'Let\'s choose your team.',
    ),
    Board(
      image: 'assets/image/no_matches.png',
      title: 'Every Day Matches',
      caption:
          'Check Every Day Matches To be up-to-date with all Soccer Matches',
      action: 'Let\'s Check Today Matches.',
    ),
    Board(
      image: 'assets/image/trophy.png',
      title: 'Every Trophy Statistics',
      caption:
          'Check Every Trophy Statistics To Know More details about Your Favourite details .',
      action: 'Let\'s Check Your Favourite Trophy.',
    ),
    Board(
      image: 'assets/image/signup.png',
      title: 'Join Us Now !',
      caption: 'Sign Up To Have More Features Comment ,Like and More.',
      action: 'Sign Up For Free.',
    ),
  ];

  void submit() {
    CacheHelper.putDynamic(key: 'OnBoarding', value: true).then((value) {
      if (value!) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SportLayout()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'In',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '90',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.green[900]),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                submit();
              },
              child: Text(
                'Skip',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ))
        ],
      ),
      body: PageView.builder(
        itemBuilder: (context, index) => buildOnBoardingItem(boarding[index]),
        controller: boardController,
        itemCount: boarding.length,
        onPageChanged: (index) {
          if (index == boarding.length - 1) {
            setState(() {
              isLast = true;
            });
          } else {
            setState(() {
              isLast = false;
            });
          }
        }
      ),
    );
  }

  Widget buildOnBoardingItem(Board board) => Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image.asset(
              board.image,
              width: double.infinity,
              height: 300,
              fit: BoxFit.contain,
            )),
            SizedBox(
              height: 100,
            ),
            Text(
              board.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              board.caption,
              style: TextStyle(height: 1.5, color: Colors.grey, fontSize: 22),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              board.action,
              style: TextStyle(
                  color: Colors.green[900],
                  fontSize: board.action.length < 27 ? 30 : 25,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 5,
                    spacing: 3,
                    activeDotColor: Colors.green,
                  ),
                  onDotClicked: (index) {
                    boardController.animateToPage(index,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.fastOutSlowIn);
                  },
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.fastOutSlowIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      );
}
