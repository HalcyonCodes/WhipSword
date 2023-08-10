import 'package:flutter/material.dart';
import 'package:whip_sword/components/whip_sword/whip_sword.dart';
import './whip_sword.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: 
           [
              
              WhipSword(
                isExpanded: false,
                headBottomMargin: 24,
                head: Container(
                  color: Colors.green,
                  height: 40,
                  width: 607,
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 46, width: 600,color: Colors.blue,margin: const EdgeInsets.only(bottom: 24),
                      child: Text('test'),
                    ),
                    Container(height: 46, width: 600,color: Colors.blue,margin: const EdgeInsets.only(bottom: 24),
                      child: Text('test'),
                    ),
                    Container(height: 46, width: 600,color: Colors.blue,margin: const EdgeInsets.only(bottom: 24),
                      child: Text('test'),
                    ),
                    Container(height: 46, width: 600,color: Colors.blue,margin: const EdgeInsets.only(bottom: 24),
                      child: Text('test'),
                    ),
                    Container(height: 46, width: 600,color: Colors.blue,margin: const EdgeInsets.only(bottom: 24),
                      child: Text('test'),
                    ),
                  ]
                ),
              ),
             WhipSword(
                headBottomMargin: 24,
                head: Container(
                  color: Colors.green,
                  height: 40,
                  width: 600,
                ),
                body: Column(
                  children: [
                     Container(height: 46, width: 600,color: Colors.blue,margin: const EdgeInsets.only(bottom: 24),
                      child: Text('test'),
                    ),
                    Container(height: 46, width: 600,color: Colors.blue,margin: const EdgeInsets.only(bottom: 24),
                      child: Text('test'),
                    ),
                    Container(height: 46, width: 600,color: Colors.blue,margin: const EdgeInsets.only(bottom: 24),
                      child: Text('test'),
                    ),
                    Container(height: 46, width: 600,color: Colors.blue,margin: const EdgeInsets.only(bottom: 24),
                      child: Text('test'),
                    ),
                    Container(height: 46, width: 600,color: Colors.blue,margin: const EdgeInsets.only(bottom: 24),
                      child: Text('test'),
                    ),
                  ],
                ),
              ),
              
              
            ],
          ),
        ),
      
     
    );
  }
}
