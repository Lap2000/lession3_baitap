import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiểm tra số nguyên tố',
      theme: ThemeData(
        cursorColor: Colors.blueAccent
      ),
      home: Check_PrimeNumber(),
    );
  }
}

class Check_PrimeNumber extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>_Check_PrimeNumberState();

}

class _Check_PrimeNumberState extends State<Check_PrimeNumber>{

  TextEditingController controller_primenumber = new TextEditingController();
  String text_output = '';
  var number;
  String snackbar_text = '';


  // bool check_number(var num) {
  //   if(runtimeType(num)==)
  // }



  String Check_PrimeNumber(int num) {
    String output;
    if( num < 2) {
      return output='Số $num không phải số nguyên tố !';
    }
    for(int i=2; i<=num-1; i++)
      {
        if(num%i==0) return output='Số $num không phải số nguyên tố !';
      }
    return 'Số $num là số nguyên tố !';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiểm tra số nguyên tố nhập vào'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 50,
                right: 50
              ),
              child: TextField(
                cursorHeight: 30,
                controller: controller_primenumber,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    try {
                      number = int.parse(controller_primenumber.text);
                      text_output = Check_PrimeNumber(number);
                    } catch(e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Số bạn nhập không hợp lệ !'))
                      );
                      //snackbar_text = 'Số bạn nhập không hợp lệ !';
                    }
                  });
                  //print(number.runtimeType);
                },
                  child: Text(
                    'Kiểm tra',
                    maxLines: 3,
                  ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.all(20),
              child:Text(
                text_output,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}