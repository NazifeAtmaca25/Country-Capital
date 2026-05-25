import 'package:bayrak_baskent/const/app_text_style.dart';
import 'package:bayrak_baskent/screen/quiz_page.dart';
import 'package:flutter/material.dart';

import '../const/app_color.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColor.homepageBackground
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryCard,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withValues(alpha: 0.5),
                          blurRadius: 10
                        )
                      ],
                      image: DecorationImage(image: AssetImage("assets/map2.png"),fit: BoxFit.fill)
                    ),
                      
                      child: Text("Ülke & Başkent", textAlign: TextAlign.center, style: AppTextStyle.homepage,)),
                  SizedBox(height: 5,),
                  Image.asset("assets/world.png",height: 400,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>QuizPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: AppColor.goldGradient,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withValues(alpha: 0.8),
                            blurRadius: 20
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.rocket_launch,color: Colors.white, size: 40,),
                          SizedBox(width: 15,),
                          Text("Başla",style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF121212),
                            letterSpacing: 1.2,
                          ),textAlign: TextAlign.center,),
                        ],
                      ),

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
