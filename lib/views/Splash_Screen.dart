
import 'package:flutter/material.dart';
import 'package:online_mart/views/WellCome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool pageOpen = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {

      if (mounted) {
        goToWelcome();
      }

    });
  }
  void goToWelcome() {

    if (pageOpen) return;

    pageOpen = true;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WellcomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [

          Image.asset(
            "assets/imagesss/asd.png",
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),

          SafeArea(
            child: SizedBox(
              height: height,
              width: width,

              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: height * 0.9,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      Image.asset(
                        "assets/imagesss/jii.png",
                        height: height * 0.40,
                        width: width * 0.70,
                        fit: BoxFit.contain,
                      ),

                      Text.rich(
                        TextSpan(
                          children: [

                            TextSpan(
                              text: "Online ",
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

                      SizedBox(height: height * 0.010),

                      Text(
                        "Shop Smart, Live Better",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.045,
                        ),
                      ),

                      SizedBox(height: height * 0.08),
                      InkWell(
                        onTap: goToWelcome,

                        child: Container(
                         // height: height * 0.06,
                          width: width * 0.78,

                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(100),
                          ),

                          child: Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.045,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.025),
                      InkWell(
                        onTap: goToWelcome,

                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: width * 0.045,
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.05),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.15,
                        ),

                        child: TweenAnimationBuilder<double>(
                          tween: Tween(
                            begin: 0,
                            end: 1,
                          ),

                          duration: Duration(seconds: 4),

                          builder: (context, value, child) {

                            return LinearProgressIndicator(
                              value: value,
                              minHeight: 7,

                              backgroundColor: Colors.pink.shade100,

                              valueColor: AlwaysStoppedAnimation(
                                Colors.pink,
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: height * 0.015),

                      Text(
                        "Loading...",
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: width * 0.035,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
