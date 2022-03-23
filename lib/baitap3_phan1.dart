import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Home_Page());
}

class Home_Page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đổi màu nền màn hình',
      theme: ThemeData(
        canvasColor: Colors.orange
      ),
      home: Change_BGcolor(),
    );
  }

}

class Change_BGcolor extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Change_BGcolorState();
}

class _Change_BGcolorState extends State<Change_BGcolor> {

  final List<Color> listcolor = [Colors.purpleAccent,Colors.red,Colors.deepPurpleAccent,
    Colors.greenAccent,Colors.yellow,Colors.blue,
    Colors.pinkAccent,Colors.blueGrey,Colors.green];
  
  int count = 0;
  Color backgound_color = Colors.white;

  bool KT_sochan(int num){
    if(num%2==0) return true;
    else return false;
  }

  Color TakeColor() {
    Random rd = new Random();
    int count = rd.nextInt(listcolor.length);
    if(listcolor[count] == backgound_color) return TakeColor();
    return listcolor[count];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgound_color,
      appBar: AppBar(
        title: Center(child: Text('Đổi màu nền')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    count++;
                    if(KT_sochan(count)) backgound_color = TakeColor();
                  });
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(70, 70)),
                  backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                  shadowColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                    side: BorderSide(color:Colors.lightBlueAccent, width: 2)
                  )),
                ),
                child: Text(
                  '+1',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: 
                Text(
                  'Số lần bạn nhấn nút : $count',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}