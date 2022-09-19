import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),//Panggil FirstScreen di sini
    );
  }
}

class FirstScreen extends StatefulWidget{
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>{
  String? language;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: DropdownButton<String>(
        items: const <DropdownMenuItem<String>>[
          DropdownMenuItem<String>(value: 'dart',child: Text('Dart')),
          DropdownMenuItem<String>(value: 'Kotlin',child: Text('Kotlin')),
          DropdownMenuItem<String>(value: 'Swift',child: Text('Swift')),
        ],
        value: language,
        hint: const Text('Select Language'),
        onChanged: (String? value){
          setState(() {
            language = value;
          });
        },
      ),
    );
  }
}

class Heading extends StatelessWidget{
  final String text; // state text bersifat final

  const Heading({Key? key, required this.text}) : super(key: key); // lalu state text masuk ke constructor

  @override
  Widget build(BuildContext context){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class BiggerText extends StatefulWidget{
  final String text; // ini parameter widget

  const BiggerText({Key? key, required this.text}) : super(key: key);

  @override
  _BiggerTextState createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText>{
  double _textSize = 16.0; //ini state dari Widget ContohStateful

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.text,
          style: TextStyle(fontSize: _textSize),
        ),
        ElevatedButton(
          child: const Text("perbesar"),
          onPressed: (){
            setState(() {
              _textSize = 32.0;
            });
          },
        )
      ],
    );
  }
}