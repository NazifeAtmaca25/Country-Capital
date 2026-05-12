import 'dart:math';

import 'package:bayrak_baskent/model/coutry_model.dart';
import 'package:bayrak_baskent/model/quiz_question.dart';

QuizQuestion getQuestion(List<CountryModel> countries){
  Random random=Random();
  final selecetedCountry=countries[random.nextInt(countries.length)];
  String correctAnswer=selecetedCountry.capital!;
  List<String> wrongAnswer=[];

  while(wrongAnswer.length<3){
    final wrongCountry=countries[random.nextInt(countries.length)];

    if(wrongCountry.capital != correctAnswer && !wrongAnswer.contains(wrongCountry.capital)){
      wrongAnswer.add(wrongCountry.capital!);
    }
  }

  List<String> options=[
    correctAnswer,
    ...wrongAnswer
  ];

  options.shuffle();

  return QuizQuestion(selecetedCountry.name!, selecetedCountry.capital!, options);
}