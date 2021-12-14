import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:project_6/homescreen.dart';
import 'package:project_6/accountscreen.dart';
import 'package:project_6/postscreen.dart';
import 'dart:convert';
import 'review.dart';
import 'envelope.dart';
import 'deta.dart';
import 'homescreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TL;DR'),
    );
  }
}

class TabInfo {
  Tab tab;
  Widget widget;

  TabInfo(this.tab, this.widget);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  
   
  final tabInfos = [
    TabInfo(
      Tab(
        icon: Icon(Icons.home),
        text: 'home',
      ),
      HomeScreen(title: '',),
      
      
           
    ),
    TabInfo(
      Tab(
        icon: Icon(Icons.post_add),
        text: 'post',
      ),
      PostScreen(title: '',),
    ),
    TabInfo(
      Tab(
        icon: Icon(Icons.account_circle),
        text: 'Account',
      ),
      
      AccountScreen(title: '',),
    ),
    
  ];
  
 
 
 

  void _showSnackbar() {
    final snackBar = SnackBar(
      content: Text("It's early for a snack"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabInfos.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: Container(
          color: Colors.blueGrey,
          child: TabBar(tabs: tabInfos.map((e) => e.tab).toList()),
        ),
        body: TabBarView(
          children: tabInfos.map((e) => e.widget).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showSnackbar,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), 
      ),
    );
  }
}

