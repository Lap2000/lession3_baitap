
import 'package:flutter/material.dart';

void main() {
  runApp(MyAppforlession3());
}

class MyAppforlession3 extends StatelessWidget {
  const MyAppforlession3({Key? key}): super(key:key);


  @override
  Widget build(BuildContext context) {
    var counter = 1;

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: Lession3HomePage(),
    );
  }
}

class Lession3HomePage extends StatefulWidget{


  @override
  State<Lession3HomePage> createState() => _Lession3HomePageState();
}

class _Lession3HomePageState extends State<Lession3HomePage> {

  var result = 0;
  TextEditingController controller_text1 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Title - Lession 3',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Chào bạn - hello'),
              Text('Số lần bạn nhấn cộng 1 :'),
              Text(result.toString(), style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network('https://icdn.dantri.com.vn/thumb_w/660/2021/09/08/316784x441-1631079051594.jpg',
                  width: 350,
                  height: 350,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(padding: EdgeInsets.all(16.0),
                    child: TextField(
                      controller: controller_text1,
                    )),
                  ),
                  SizedBox(width: 15),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 16
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(controller_text1.text))
                        );
                      },
                      child: Text('Click here')
                ),
                  ),
              ])
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            result +=1;
          });
        },
        child: Icon(
          Icons.plus_one,
        ),
      ),
    );
  }
  
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  // @override
  // void didUpdateWidget(Widget oldWidget) {
  //   super.didUpdateWidget(oldWidget)
  // }
}