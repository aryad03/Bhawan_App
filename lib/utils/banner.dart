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
                color: Colors.blue[200],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[200],
                image: DecorationImage(image: AssetImage("images/Thomso.jpg"), fit: BoxFit.fill)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[200],
                image: DecorationImage(image: AssetImage("images/Cautley.jpg"), fit: BoxFit.fill)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[200],
                image: DecorationImage(image: AssetImage("images/ganga.webp"), fit: BoxFit.fill)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[200],
                image: DecorationImage(image: AssetImage("images/kb.jpg"), fit: BoxFit.fill)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[200],
                image: DecorationImage(image: AssetImage("images/Radhakrishnan.webp"), fit: BoxFit.fill)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[200],
                image: DecorationImage(image: AssetImage("images/rajendra.jpg"), fit: BoxFit.fill)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[200],
                image: DecorationImage(image: AssetImage("images/rajiv.jpg"), fit: BoxFit.fill)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[200],
                image: DecorationImage(image: AssetImage("images/jawahar.jfif"), fit: BoxFit.fill)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[200],
                image: DecorationImage(image: AssetImage("images/sb.jpg"), fit: BoxFit.fill)
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
                  SizedBox(height: size.height*0.025,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardField(
                            size,
                            Colors.blue,
                            IconButton(
                              icon: Icon(Icons.person, size: 35,),
                              color: Colors.white, onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));
                            },
                            ),
                            'Profile',),
                          CardField(
                            size,
                            Colors.blue,
                            IconButton(
                              icon: Icon(Icons.meeting_room, size: 35,),
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
                            IconButton(icon: Icon(Icons.report_problem, size: 35,), color: Colors.white, onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TabsScreen()));

                            },),
                            'Complain',),
                          CardField(
                            size,
                            Colors.blue,
                            IconButton(icon: Icon(Icons.water, size: 35,), color: Colors.white, onPressed: () {
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
                            IconButton( icon: Icon(Icons.dining, size: 35,), color: Colors.white, onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()));
                            },),
                            'Mess Menu',),
                          CardField(
                            size,
                            Colors.blue,
                            IconButton(icon: Icon(Icons.info, size: 35,), color: Colors.white, onPressed: () {
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
            height: size.height * .14,
            width: size.width * .43,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35.0,
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