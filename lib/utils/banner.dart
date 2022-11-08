import 'package:bhawan_app/models/user_auth.dart';
import 'package:bhawan_app/services/database_laundry.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bhawan_app/screens/laundryPage.dart';
import 'package:bhawan_app/screens/mess.dart';
import 'package:bhawan_app/screens/tabs.dart';
import 'package:provider/provider.dart';
import '../screens/profilePage.dart';
import '../screens/EntryExit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main4()=>runApp(BannerPage());
class BannerPage extends StatelessWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataGlobal>(context);
    final user = Provider.of<UserAuth>(context);

    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        CarouselSlider(items: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: AnimatedTextKit(animatedTexts: [
              TyperAnimatedText("Welcome!",
                  speed: Duration(milliseconds: 450),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ))
            ],
            ),
            decoration: BoxDecoration(
                color: Colors.blue[200]
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.purple[200],
                image: DecorationImage(image: AssetImage("images/Thomso.jpg"), fit: BoxFit.fill)
            ),
          ),
        ], options: CarouselOptions(
            height: size.height * .4,
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            viewportFraction: 1.0,
            autoPlayAnimationDuration: Duration(milliseconds: 800)
        ), ),
        Container(
            height: size.height*.5,
            width: size.width*.8,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height*0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardField(
                            size,
                            Colors.blue,
                            IconButton(
                              icon: Icon(Icons.person),
                              color: Colors.white, onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));
                            },
                            ),
                            'Profile',),
                          CardField(
                            size,
                            Colors.blue,
                            IconButton(
                              icon: Icon(Icons.meeting_room),
                              color: Colors.white, onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UserEntry()));
                            },
                            ),
                            'Entry-Exit',),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardField(
                            size,
                            Colors.blue,
                            IconButton(icon: Icon(Icons.report_problem), color: Colors.white, onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TabsScreen()));

                            },),
                            'Complain',),
                          CardField(
                            size,
                            Colors.blue,
                            IconButton(icon: Icon(Icons.water), color: Colors.white, onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TemplateUser()));
                            },),
                            'Laundry',),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardField(
                            size,
                            Colors.blue,
                            IconButton( icon: Icon(Icons.dining), color: Colors.white, onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()));
                            },),
                            'Mess Menu',),
                          CardField(
                            size,
                            Colors.blue,
                            IconButton(icon: Icon(Icons.info), color: Colors.white, onPressed: () {
                              Navigator.pop(context);
                            },),
                            'Notice Board',),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
        )
      ],
    );
  }
}

CardField(
    Size size,
    Color color,
    IconButton icon,
    String title,
    ) {
  return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        elevation: 0,
        shadowColor: Colors.white,
        child: SizedBox(
            height: size.height * .1,
            width: size.width * .43,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: color,
                    child: icon,
                  ),
                  SizedBox(height: 5),
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ]
            )
        ),
      )
  );
}