import 'package:flutter/material.dart';
import 'package:bhawan_app/button.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final controller=TextEditingController();
  String data="Akanksha";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Bhawan App",),
            backgroundColor: Colors.purple,
          ),
          body:
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, top: 7),
                  child: Text("My Profile ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      height: 150,
                      child: Image.asset("assets/Me.jpg") ,
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Column(
                        children: [
                          Text(data),
                          TextField(
                            controller: controller ,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Button('Save Changes',() {
                  setState(() {

                  });
                }),
              ],
            ),
          ),
        )
    );
  }
}
