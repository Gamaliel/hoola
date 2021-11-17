import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  final PageController pageController = new PageController( initialPage: 1 );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* AppBar
       appBar: AppBar(
         title: Text('Hoola $currentPage'),
         elevation: 12,
        ),

        // ? How to change the screen....
        //*
        //body: CustomScreen(color: Colors.blue),
        body: PageView(
          controller: pageController,
         // physics: BouncingScrollPhysics(),
         physics: NeverScrollableScrollPhysics(),
          children: [
            CustomScreen(color: Colors.pink),
            CustomScreen(color: Colors.green),
            CustomScreen(color: Colors.indigo),
          ],
        ) ,
        //body: CustomScreen(color: Colors.indigo,),

        // body: currentPage == 0
        // ? CustomScreen(color: Colors.lightBlue)
        // : currentPage == 1  
        //     ? CustomScreen(color: Colors.green)
        //     : CustomScreen(color: Colors.indigo,),
       
       //* Tabs of navigation
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index){            
            currentPage = index;
            pageController.animateToPage(index, 
                 duration: Duration(milliseconds: 300), 
                 curve: Curves.bounceOut);

            //print('Index $index');
            setState(() {});},
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_outlined),
            label: 'User'),  

            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings'),
              
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Cart')

          ],

        ),
      );
  }
}

class CustomScreen extends StatelessWidget {

  final Color color;

  const CustomScreen({ required this.color });  

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: color,
      child: Center(
          child: Text('Custom Screen..'),
      ),
    );
  }
}

