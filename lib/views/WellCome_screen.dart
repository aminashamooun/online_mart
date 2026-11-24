
import 'package:flutter/material.dart';
import 'package:online_mart/Home_Screen.dart';
import 'package:online_mart/views/Order_Placed.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/imagesss/hum.png",
                height: height * 0.35,
                width: width,
                fit: BoxFit.contain,
              ),


              SizedBox(height: height * 0.03),
                Text("Welcome to",style: TextStyle(color: Colors.black,fontSize: 50),),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Online",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "Mart",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: TextStyle(
                  fontSize: width * 0.10,
                ),
              ),
               Text("Your favorite shopping app",style: TextStyle(color: Colors.black,fontSize: 25),),
              Text("is here",style: TextStyle(color: Colors.black,fontSize: 25),),
              SizedBox(height: height * 0.08),
              Container(
              //  height: height*0.2,
                width: width * 0.78,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.065,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height*0.025),
              Container(
               // height: height*0.2,
                width: width * 0.78,
                decoration: BoxDecoration(
                  color:  Colors.black,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(
                        builder: (context)=>HomeScreen(),
                      )
                      );
                    },
                    child: InkWell(
                      onTap: (){
                        Navigator.push((context), MaterialPageRoute(builder: (context)=>OrderPlacedScreen(),));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.065,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
