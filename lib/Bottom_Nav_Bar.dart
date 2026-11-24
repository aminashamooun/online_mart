
import 'package:flutter/material.dart';
import 'package:online_mart/Cart.dart';
import 'package:online_mart/Category.dart';
import 'package:online_mart/Profile.dart';
import 'package:online_mart/Wishlist.dart';
import 'Home_Screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int selectIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartPage(),
    Wishlist(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    final isTablet = size.shortestSide >= 600;

    final isLandscape = width > height;

    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        bottom: false,

        child: isTablet
            ? Row(
          children: [

            NavigationRail(
              backgroundColor:  Color(0xFFF8E5F5),

              selectedIndex: selectIndex,

              onDestinationSelected: (index) {
                setState(() {
                  selectIndex = index;
                });
              },

              labelType: NavigationRailLabelType.all,

              selectedIconTheme:  IconThemeData(
                color: Colors.pinkAccent,
                size: 23,
              ),

              unselectedIconTheme:  IconThemeData(
                color: Colors.blueGrey,
                size: 20,
              ),

              destinations: [

                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("Home",style: TextStyle(color: Colors.pinkAccent),),
                ),

                NavigationRailDestination(
                  icon: Icon(Icons.category_outlined),
                  label: Text("Category",style: TextStyle(color: Colors.pinkAccent),),
                ),

                NavigationRailDestination(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: Text("Cart",style: TextStyle(color: Colors.pinkAccent),),
                ),

                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  label: Text("Wishlist",style: TextStyle(color: Colors.pinkAccent),),
                ),

                NavigationRailDestination(
                  icon: Icon(Icons.person_outline),
                  label: Text("Profile",style: TextStyle(color: Colors.pinkAccent),),
                ),
              ],
            ),

            Expanded(
              child: screens[selectIndex],
            ),
          ],
        )

            : SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: screens[selectIndex],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: isTablet
          ? null
          : SafeArea(
        top: false,

        child: BottomNavigationBar(
          backgroundColor: Color(0xFFFFF7FC),

          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.blueGrey,

          type: BottomNavigationBarType.fixed,

          currentIndex: selectIndex,

          elevation: 0,
          showSelectedLabels: !isLandscape,
          showUnselectedLabels: !isLandscape,

          selectedFontSize: 10,
          unselectedFontSize: 9,

          iconSize: isLandscape ? 18 : 21,

          onTap: (index) {
            setState(() {
              selectIndex = index;
            });
          },

          items:  [

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: "Category",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Wishlist",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
