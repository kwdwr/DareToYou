import 'package:flutter/material.dart';
import 'questions.dart';

class QuestionCardWidget extends StatefulWidget {
  final question questioncard;

  const QuestionCardWidget({
    Key? key,
    required this.questioncard
  }) : super(key: key);

  @override
  State<QuestionCardWidget> createState() => QuestionCardWidgetState();
}

class QuestionCardWidgetState extends State<QuestionCardWidget> {
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://w0.peakpx.com/wallpaper/312/558/HD-wallpaper-gray-texture-gray-stone-background-black-texture-gray-background-stylish-gray-texture-matte-gray-texture.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment(-0.3, 0),
          )),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent,Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7,1],
            )
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              builType(),
              const SizedBox(height: 15),
              buildquest(),
            ],
          ),
        ),
      ),
    ),
  );

  Widget builType() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      Flexible(child: Text(
        widget.questioncard.type,
        style: const TextStyle(fontSize: 32, color: Colors.white,fontWeight: FontWeight.bold),
      )),

      const SizedBox(width: 16),

    ],
  );
  Widget buildquest()=>Row(
    children: [
      Flexible(child: Text(
        widget.questioncard.questiondata,
        style: const TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),)
    ],
  );
}
