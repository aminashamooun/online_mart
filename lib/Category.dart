
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),

            child: Column(
              children: [


                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),

                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 27,
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  children: [

                    Expanded(
                      child: Container(
                        height: width * 0.42,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8E5F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Image.asset(
                                "assets/imagesss/fff.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            Text(
                              "Women\nFashion",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 15),

                    Expanded(
                      child: Container(
                        height: width * 0.42,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8E5F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Image.asset(
                                "assets/imagesss/boy.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            Text(
                              "Men\nFashion",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 15),
                Row(
                  children: [

                    Expanded(
                      child: Container(
                        height: width * 0.42,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8E5F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Image.asset(
                                "assets/imagesss/els.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            Text(
                              "heels",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 15),

                    Expanded(
                      child: Container(
                        height: width * 0.42,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8E5F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Image.asset(
                                "assets/imagesss/jugr.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            Text(
                              "Shoes",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 15),
                Row(
                  children: [

                    Expanded(
                      child: Container(
                        height: width * 0.42,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8E5F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Image.asset(
                                "assets/imagesss/bag.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            Text(
                              "Bags",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 15),

                    Expanded(
                      child: Container(
                        height: width * 0.42,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8E5F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Image.asset(
                                "assets/imagesss/wait.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            Text(
                              "Watches",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 15),
                Row(
                  children: [

                    Expanded(
                      child: Container(
                        height: width * 0.42,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8E5F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Image.asset(
                                "assets/imagesss/makup.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            Text(
                              "Beauty&\nPersonal Care",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 15),

                    Expanded(
                      child: Container(
                        height: width * 0.42,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8E5F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Image.asset(
                                "assets/imagesss/abc.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            Text(
                              "Abaya",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 15),
                Row(
                  children: [

                    Expanded(
                      child: Container(
                        height: width * 0.42,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8E5F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Image.asset(
                                "assets/imagesss/elec.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            Text(
                              "Electronics",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 15),

                    Expanded(
                      child: Container(
                        height: width * 0.42,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8E5F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Image.asset(
                                "assets/imagesss/living.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            Text(
                              "Home &\nLiving",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 15),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
