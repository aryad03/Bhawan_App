import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main4()=>runApp(BannerPage());
class BannerPage extends StatelessWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider(items: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Text("Welcome!",style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color: Colors.purple[200]
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.purple[200],
                image: DecorationImage(image: AssetImage("images/Thomso.jpg"), fit: BoxFit.fill)
            ),
          ),
        ], options: CarouselOptions(
            height: 230.0,
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            viewportFraction: 1.0,
            autoPlayAnimationDuration: Duration(milliseconds: 800)
        ), ),
        Container(
            child: Column(
              children: [
                SizedBox(height: 12,),
                Container(
                  margin: EdgeInsets.all(5),
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(5.0))
                  // ),
                  child: Text("An app for the bhawans of IIT-R",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  ),
                ),
                SizedBox(height: 4),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  leading: Icon(Icons.meeting_room),
                  title: Text('Digitalized entry-exit system'),
                ),
                ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    leading: Icon(Icons.water),
                    title: Text("Know the status of your laundry online")
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  leading: Icon(Icons.report_problem),
                  title: Text('Register a complain from anywhere anytime'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  leading: Icon(Icons.info),
                  title: Text('Get the mess menu and the noticeboard on your device'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  leading: Icon(Icons.people),
                  title: Text('Know your bhawan council and bhawan management team'),
                )
              ],
            )
        )
      ],
    );
  }
}
