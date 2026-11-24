
import 'package:flutter/material.dart';
import 'package:online_mart/Bottom_Nav_Bar.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:  Color(0xffF8D9EB),

      body: SafeArea(
        child: SingleChildScrollView(

          child: Center(
            child: Container(
              width: width * 0.94,
              padding:  EdgeInsets.all(20),

              decoration: BoxDecoration(
                color:  Color(0xffFFF7FC),
                borderRadius: BorderRadius.circular(30),
              ),

              child: OrientationBuilder(
                builder: (context, orientation) {

                  if (orientation == Orientation.landscape) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Icon(
                              Icons.check_circle,
                              color: Colors.pink,
                              size: width * 0.16,
                            ),

                             SizedBox(height: 15),

                            Icon(
                              Icons.shopping_bag,
                              color: Colors.pink,
                              size: width * 0.15,
                            ),
                          ],
                        ),

                        Expanded(
                          child: Column(
                            children: [

                              Text(
                                "Order Placed!",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff17132E),
                                ),
                              ),

                              SizedBox(height: 10),

                               Text(
                                "Your order has been placed\nsuccessfully.",
                                textAlign: TextAlign.center,
                              ),

                              SizedBox(height: 20),


                              SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink,
                                    foregroundColor: Colors.white,
                                  ),
                                  child:  Text("Track Order"),
                                ),
                              ),

                             SizedBox(height: 10),

                              SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child:  Text(
                                    "Continue Shopping",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );

                  } else {

                    return Column(
                      children: [

                        SizedBox(height: height * 0.04),


                        Icon(
                          Icons.check_circle,
                          color: Colors.pink,
                          size: width * 0.32,
                        ),

                        SizedBox(height: height * 0.03),

                        Text(
                          "Order Placed!",
                          style: TextStyle(
                            fontSize: width * 0.065,
                            fontWeight: FontWeight.bold,
                            color:  Color(0xff17132E),
                          ),
                        ),

                        SizedBox(height: height * 0.02),

                        Text(
                          "Your order has been placed\nsuccessfully.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: width * 0.038,
                            color: Colors.black87,
                          ),
                        ),

                        SizedBox(height: height * 0.04),

                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                            ),
                            child:  Text("Track Order"),
                          ),
                        ),

                      SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: InkWell(
                              onTap: (){
                                Navigator.push((context), MaterialPageRoute(builder: (context)=>BottomNavBar()));
                              },
                              child:  Text(
                                "Continue Shopping",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Icon(
                              Icons.shopping_bag,
                              size: width * 0.20,
                              color: Colors.orange,
                            ),

                            Icon(
                              Icons.shopping_bag,
                              size: width * 0.28,
                              color: Colors.pink,
                            ),

                            Icon(
                              Icons.shopping_bag,
                              size: width * 0.20,
                              color: Colors.pinkAccent,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
