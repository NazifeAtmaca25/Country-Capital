import 'dart:async';

import 'package:bayrak_baskent/const/app_color.dart';
import 'package:bayrak_baskent/const/app_text_style.dart';
import 'package:bayrak_baskent/const/status.dart';
import 'package:bayrak_baskent/model/coutry_model.dart';
import 'package:bayrak_baskent/model/quiz_question.dart';
import 'package:bayrak_baskent/services/country_services.dart';
import 'package:bayrak_baskent/services/quiz_generator.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../const/app_style.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<CountryModel> countries = [];
  List<QuizQuestion> question = [];
  Timer? nextTimer;
  int questionIndex = 0;
  int correctCount = 0;
  int wrongCount = 0;
  var status = Status.QUESTION;
  bool isClick=false;
  String selectedOption= "";
  double progressValue = 0;

  Future<void> loadData() async {
    try {
      countries = await CountryApi.getData();
      question = List.generate(15, (index) => getQuestion(countries));
    } catch (e) {
      print("Data çekme hatası $e");
    }
  }

  void nextQuest(){
    if(questionIndex < question.length - 1){
      setState(() {
        status = Status.QUESTION;
        isClick = false;
        questionIndex++;
        selectedOption = "";
        progressValue = 0;
      });

    }else{
      nextTimer?.cancel();
    }
  }

  Future<void> nextQuestion() async{
    progressValue=0;
    nextTimer=Timer.periodic(Duration(milliseconds: 100), (timer){
      setState(() {
        progressValue+=0.01;
      });
      if(progressValue >= 1){
        timer.cancel();
        nextQuest();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }



  @override
  Widget build(BuildContext context) {
    if(question.isEmpty){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: AppColor.mainBackground),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Soru ${questionIndex+1}/15",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.appTittle,
                ),
                SizedBox(height: 15),
                StepProgressIndicator(
                  totalSteps: 15,
                  currentStep: questionIndex,
                  selectedColor: AppColor.progressActive,
                  unselectedColor: AppColor.progressInactive,
                  roundedEdges: Radius.circular(10),
                ),
                SizedBox(height: 15),
                questionContainer(status),
                SizedBox(height: 10),
                questionOption(),
                SizedBox(height: 10,),
                if(isClick)
                  next()



              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget next(){
    return Column(
      children: [
        Text("Sonraki soruya geçiliyor...",style: TextStyle(color: Colors.white,fontSize: 16),),
        LinearProgressIndicator(
          value: progressValue,
          minHeight: 8,
          backgroundColor: AppColor.progressInactive,
          valueColor: AlwaysStoppedAnimation(
            AppColor.progressActive,
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.background,
              shape: RoundedRectangleBorder(
                borderRadius: AppStyle.radius,
                side: BorderSide(color: AppColor.gold)
              )
            ),
              onPressed: (){
              nextTimer?.cancel();
              nextQuest();

          }, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sıradaki Soru",style: AppTextStyle.appTittle,textAlign: TextAlign.center,),
                SizedBox(width: 20,),
                Icon(Icons.arrow_forward_sharp,size: 24,color: Colors.white,)
              ],
            ),
          )),
        )
      ],
    );
  }

  Widget questionContainer(Status status) {
    switch(status){
      case Status.QUESTION:
        return Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColor.secondaryCard,
            borderRadius: AppStyle.radius,
            boxShadow: [
              BoxShadow(color: Colors.white.withValues(alpha: 0.5), blurRadius: 10),
            ],
            image: DecorationImage(
              image: AssetImage("assets/map2.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bu ülkenin başkenti neresidir?",
                  style: AppTextStyle.question,
                ),
                SizedBox(height: 20),
                Text(question[questionIndex].country, style: AppTextStyle.title),
              ],
            ),
          ),
        );
      case Status.CORRECT:
        return Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: AppColor.successGradient,
            borderRadius: AppStyle.radius,
            boxShadow: [
              BoxShadow(color: Colors.white.withValues(alpha: 0.5), blurRadius: 10),
            ],
            image: DecorationImage(
              image: AssetImage("assets/konfeti.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColor.successTick,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent.withValues(alpha: 0.5),
                        blurRadius: 25,
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        offset: Offset(0, 8),
                        blurRadius: 15,
                      ),
                    ],
                    border: BoxBorder.all(
                      color: Colors.white.withValues(alpha: 0.25),
                      width: 2,
                    )
                  ),
                  child: Icon(Icons.check,color: Colors.white,size: 18,),
                ),
                SizedBox(height: 15),
                Text(
                  "Doğru!",
                  style: AppTextStyle.question,
                ),
                SizedBox(height: 15),
                Text("Tebrikler, doğru cevap.", style: AppTextStyle.appTittle),
              ],
            ),
          ),
        );
      case Status.WRONG:
        return Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: AppColor.errorGradient,
            borderRadius: AppStyle.radius,
            boxShadow: [
              BoxShadow(color: Colors.white.withValues(alpha: 0.5), blurRadius: 10),
            ],
            image: DecorationImage(
              image: AssetImage("assets/konfeti.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColor.errorTic,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent.withValues(alpha: 0.5),
                          blurRadius: 25,
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          offset: Offset(0, 8),
                          blurRadius: 15,
                        ),
                      ],
                      border: BoxBorder.all(
                        color: Colors.white.withValues(alpha: 0.25),
                        width: 2,
                      )
                  ),
                  child: Icon(Icons.close_rounded,color: Colors.white,size: 18,),
                ),
                SizedBox(height: 15),
                Text(
                  "Yanlış!",
                  style: AppTextStyle.question,
                ),
                SizedBox(height: 15),
                Text("Maalesef, yanlış cevap.", style: AppTextStyle.appTittle),
              ],
            ),
          ),
        );
    }
  }

  Widget questionOption() {
    return Column(
      children: [
        cevap(
          question[questionIndex].capitals[0],
          question[questionIndex].correctCapital,
          "A",
        ),
        cevap(
          question[questionIndex].capitals[1],
          question[questionIndex].correctCapital,
          "B",
        ),
        cevap(
          question[questionIndex].capitals[2],
          question[questionIndex].correctCapital,
          "C",
        ),
        cevap(
          question[questionIndex].capitals[3],
          question[questionIndex].correctCapital,
          "D",
        ),
      ],
    );
  }

  Widget cevap(String option, String corroctOption, String index) {
    return GestureDetector(
      onTap:isClick? null : () {
        if (option == corroctOption) {
          setState(() {
            status = Status.CORRECT;
            correctCount++;
            isClick=true;
            selectedOption=option;
            nextQuestion();
          });
        } else {
          setState(() {
            status = Status.WRONG;
            wrongCount++;
            isClick=true;
            selectedOption=option;
            nextQuestion();
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color:AppColor.buttonWhite,
            gradient: isClick? option == corroctOption? AppColor.successGradient : option == selectedOption && option != corroctOption? AppColor.errorGradient:null:null,
            border: BoxBorder.all(color: isClick? option == corroctOption? AppColor.success.withValues(alpha: 0.5) : option == selectedOption && option != corroctOption? AppColor.error.withValues(alpha: 0.5):AppColor.buttonBorder.withValues(alpha: 0.5):AppColor.buttonBorder.withValues(alpha: 0.5)),
            borderRadius: AppStyle.radius,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 18,
                spreadRadius: 1,
                offset: Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color:AppColor.buttonWhite,
                    gradient: isClick? option == corroctOption? AppColor.successGradient : option == selectedOption && option != corroctOption? AppColor.errorGradient:null:null,
                    border: BoxBorder.all(color: AppColor.buttonBorder.withValues(alpha: 0.5),width: 0.5),
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                  ),
                  child: Text(
                    index,
                    style: AppTextStyle.answer,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 10),
                Text(option, style: AppTextStyle.answer),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
