import 'dart:ui';

import 'package:daretoyouapp/core/widgets/question_widgets/question_card_widget.dart';
import 'package:daretoyouapp/core/widgets/question_widgets/questions.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

const List<Color> _kDefaultRainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => SearchPageState();
}
class SearchPageState extends State<SearchPage> {
  bool isClosed = false;
  double isstate = 10.0;
  var question1=  const question(type: "Doğruluk: ", questiondata: "Telefonunda en son aradığın şey neydi?");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SizedBox.expand(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.cyan,
                Color(0xFFB64355),
              ],
            )),
            child: SafeArea(

                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        !isClosed ? buildIndicator() : Container(child: Text("Deneme")),
                        Expanded(child: QuestionCardWidget(questioncard: question1,)),
                        const SizedBox(height: 20),
                        buildButtons(),
                        const SizedBox(height: 20),
                       InkWell(
                          splashColor: const Color(0xff0d3c54),
                          onTap: () {
                            setState(() {
                              if (isClosed == false) {
                                isClosed = true;
                                isstate = 0;
                              } else {
                                isClosed = false;
                                isstate = 10.0;
                              }
                            });
                          },
                          child: Container(
                            height: 75,
                            width: 300,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.pink,
                                    Color(0xff1e73a9),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                              child: Text(
                                'Bas kaybolsun',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

            )),
      ),
    );
  }

  SizedBox buildIndicator() => SizedBox(
        width: 200,
        height: 200,
        child: BackdropFilter(filter: ImageFilter.blur(sigmaY: isstate,sigmaX: isstate),
        child: const LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: _kDefaultRainbowColors,
        ),),
      );
  Widget buildButtons() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(elevation: 8,backgroundColor: Colors.white,shape: const CircleBorder(),minimumSize: const Size.square(80)),
        onPressed: (){},
        child: const Icon(Icons.clear,color:Colors.red,size:40),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(elevation: 8,backgroundColor: Colors.white,shape: const CircleBorder(),minimumSize: const Size.square(80)),
        onPressed: (){},
        child: const Icon(Icons.favorite,color:Colors.teal,size:40),
      ),
    ],
  );
}
