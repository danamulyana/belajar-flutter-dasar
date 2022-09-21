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
      home: const FirstScreen(),
    );
  }
}

//Navigation
class FirstScreen extends StatelessWidget{
  const FirstScreen({Key? key}) : super(key: key);
  final String message = 'Hello from First Screen!';
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen(message))
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
  final String message;

  const SecondScreen(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            OutlineButton(
              child: const Text('Kembali'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

//END Navigation

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: const [
                ExpandedWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: const[
                ExpandedWidget(),
                ExpandedWidget()
              ],
            ),
            Row(
              children: const[
                FlexibleWidget(),
                FlexibleWidget()
              ],
            ),
            Row(
              children: const[
                FlexibleWidget(),
                ExpandedWidget()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Expanded',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class Rainbow extends StatelessWidget{
  const Rainbow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
              color: Colors.red,
            ),
        ),
        Expanded(
          child: Container(
            color: Colors.orange,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.indigo,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.purple,
          ),
        ),
      ],
    );
  }
}

class ListViewSeparated extends StatelessWidget{
  const ListViewSeparated({Key? key}) : super(key: key);

  final List<int> numberList = const <int>[1,2,3,4,5,6,7,8,9,10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context,int index){
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return const Divider();
        },
      )
    );
  }
}

class ListViewBuilder extends StatelessWidget{
  const ListViewBuilder({Key? key}) : super(key: key);

  final List<int> numberList = const <int>[1,2,3,4,5,6,7,8,9,10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context,int index){
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScrollingScreen extends StatelessWidget{
  const ScrollingScreen({Key? key}) : super(key: key);

  final List<int> numberList = const <int>[1,2,3,4,5,6,7,8,9,10];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: numberList.map((number) {
          return Container(
            height: 250,
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(fontSize: 50),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
        );
        }).toList(),
      ),
    );
  }
}

// class FirstScreen extends StatefulWidget{
//   const FirstScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FirstScreen> createState() => _FirstScreenState();
// }
//
// class _FirstScreenState extends State<FirstScreen>{
//   bool agree = false;
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Screen'),
//       ),
//       body: Center(
//         child: Image.asset(
//           'images/IDCAMP_LOGO.png',
//           width: 200,
//           height: 200,
//         ),
//       )
//     );
//   }
// }

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