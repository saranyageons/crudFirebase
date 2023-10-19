
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'crud/listview.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              page1(),
              page2(),
              page3()
            ],
          ),
          //dot indicator
          Container(
            alignment: Alignment(0, 0.80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //SKIP
                  GestureDetector(
                onTap: () {
                  _controller.jumpToPage(3);},
                      child: Text('Skip')),
                  //DOT INDICATOR
                  SmoothPageIndicator(controller: _controller, count: 3),
                  //NEXT OR DONE
                  GestureDetector(
                      onTap: () {
                        _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const list()));
                        Text('Next');
                      }
                  ),],
              ),),
        ],
      ),
    );
  }
}

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 300)),
              Center(child: Text('Welcome to My Online Vipani',style: TextStyle(fontWeight: FontWeight.bold),),),
              Image.asset('assests/images/onboarding-1.png'),
              Center(child: Text("Fresh Vegetables and Grocery Online Shopping",style: TextStyle(fontWeight: FontWeight.bold),),),
            ],
          )
        ),
      ),
    );
  }
}

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

 class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightGreen[100],
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 250)),
              Center(child: Text('Free Same Day Delivery',style: TextStyle(fontWeight: FontWeight.bold),),),
              Image.asset('assests/images/onboarding-2.png'),
              Center(child: Text("Free delivery and same day delivery available",style: TextStyle(fontWeight: FontWeight.bold),),),
            ],
          )
        ),
      ),
    );
  }

}
  class page3 extends StatefulWidget {
  const page3({super.key});


  @override
  State<page3> createState() => _page3State();
}

  class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        color: Colors.blue[100],
        child: Center(
          child: Image.asset('assests/images/onboarding-3.png')
        ),
      ),
    );

  }
}


