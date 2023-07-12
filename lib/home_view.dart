import 'dart:async';

import 'package:flappy_bird/barrier.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flappy_bird/flappy_bird_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//ignore: must_be_immutable
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool isGameStarted = false;
  bool userLose = false;
  static double barrierXone = 0;
  double barrierXtwo = barrierXone + 1.5;

  int score = 0;

  startGame() {
    isGameStarted = true;
    barrierXone = 0;
    barrierXtwo = barrierXone + 1.5;
    Timer.periodic(
      const Duration(milliseconds: 75),
      (timer) {
        time += .05;
        height = -4.9 * time * time + 2.8 * time;
        setState(() {
          birdYaxis = initialHeight - height;
        });
        setState(() {
          if (barrierXone < -1.7) {
            barrierXone += 3;
            score++;
          }
          else {
            barrierXone -= .04;
          }
        });
       setState(() {
         if (barrierXtwo < -1.7) {
           barrierXtwo += 3;
           score++;
         }
         else {
           barrierXtwo -= .04;
         }
       });
       setState(() {
         if (birdYaxis > 1.1) {
           timer.cancel();
           userLoseGame();
         }
       });
       /////////////////
        setState(() {
          if( barrierXone <=-.58 && birdYaxis <= -.58){
            userLoseGame() ;
          }
        });
        setState(() {
          if( barrierXone <=-.58 && birdYaxis >= .175){
            userLoseGame() ;
          }
        });
        setState(() {
          if( barrierXtwo <=-.58 && birdYaxis <= -.4){
            userLoseGame() ;
          }
        });
        setState(() {
          if( barrierXtwo <=-.58 && birdYaxis >= .69){
            userLoseGame() ;
          }
        });
      },
    );
  }

  jumb() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
      // setState(() {
      //   // if(birdYaxis <= -1 ){
      //   //   userLose = true ;
      //   // }
      // });

    });
  }
  userLoseGame() {
    setState(() {
      userLose = true;

    });

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!userLose){
          isGameStarted ? jumb() : startGame();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        alignment: Alignment(-1, birdYaxis),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        color: Colors.blue,
                        child: const Bird(),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXone, 1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 180.h,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXone, -1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 100.h,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXtwo, 1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 80.h,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXtwo, -1),
                        duration: Duration(
                          milliseconds: 0,
                        ),
                        child: Barrier(
                          size: 150.h,
                        ),
                      ),
                    ],
                    //80 150
                  ),
                ),
                Container(
                  color: Colors.green,
                  height: 15.h,
                ),
                Expanded(
                  child: Container(
                    color: Colors.brown,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Score',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '$score',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (userLose)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                color: Colors.black45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlappyBirdTitle(),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextButton(
                      child: Text(
                        'Start again',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if(birdYaxis >= 1.1){
                          setState(() {
                            userLose = false;
                            birdYaxis = 0;
                            time = 0;
                            height = 0;
                            initialHeight = birdYaxis;
                            score = 0;
                          });
                          startGame();
                        }

                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
