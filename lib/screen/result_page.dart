import 'package:bayrak_baskent/const/app_color.dart';
import 'package:bayrak_baskent/const/app_style.dart';
import 'package:bayrak_baskent/const/app_text_style.dart';
import 'package:bayrak_baskent/screen/homepage.dart';
import 'package:bayrak_baskent/screen/quiz_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int correctCount;
  final int wrongCount;

  const ResultPage({
    super.key,
    required this.correctCount,
    required this.wrongCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: AppColor.homepageBackground),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Image.asset("assets/kupa.png"),
                Text("Tebrikler!", style: AppTextStyle.tebrik),
                Text("Quiz'i tamamladın.", style: AppTextStyle.appTittle),
                Container(
                  margin: EdgeInsets.all(20),
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: AppColor.resultBackground,
                    border: Border.all(color: AppColor.secondaryCard),
                    borderRadius: AppStyle.radius,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text("Puanın", style: AppTextStyle.appTittle),
                        Text(
                          "$correctCount/${correctCount + wrongCount}",
                          style: AppTextStyle.appTittle,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [buildContainer(Icons.check,"Doğru",correctCount.toString()),
                          buildContainer(Icons.close_rounded,"Yanlış",wrongCount.toString()),
                          buildContainer(Icons.track_changes,"Başarı","%${((correctCount/(correctCount+wrongCount))*100).toStringAsFixed(2)}")]),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>QuizPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: AppColor.goldGradient,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.orange.withValues(alpha: 0.5),
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.refresh,color: Color(0xFF121212), size: 30,),
                        SizedBox(width: 15,),
                        Text("Tekrar Oyna",style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF121212),
                        ),textAlign: TextAlign.center,),
                      ],
                    ),

                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Homepage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryCard,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Color(0xFF1B2B7A),
                          width: 2
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home_outlined,color: Colors.white, size: 30,),
                        SizedBox(width: 15,),
                        Text("Ana Sayfaya Dön",style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer(IconData icon, String label, String count) {
    return Container(
      height: 100,
      width: 80,
      decoration: BoxDecoration(
        gradient: AppColor.resultBackground,
        border: Border.all(color: AppColor.secondaryCard),
        borderRadius: AppStyle.radius,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(icon,color: Colors.white,size: 24,),
              SizedBox(height: 10,),
              Text(label,style:TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),),
              Text(count,style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
