import 'package:flutter/material.dart';
import 'package:project_6/homescreen.dart';
import 'review.dart';
import 'deta.dart';
import 'homescreen.dart';



class PostScreen extends StatefulWidget {
  const PostScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PostScreen> createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  int _counter = 0;
  TextEditingController author = new TextEditingController();
  TextEditingController body = new TextEditingController();
  TextEditingController reviewer = new TextEditingController();
  TextEditingController title = new TextEditingController();
  final things = [
    Review(author: 'author', body: 'Post a Review', reviewer: 'reviewer', title: 'title'),
    
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: ListView.builder(
          itemCount: things.length,
          itemBuilder: (context, index) {
            var item = Review(author: author.text, body: body.text, reviewer: reviewer.text, title: title.text);
            return ExpansionTile(
              
              title: Text('Post a Review'),
              children: [
                TextField(
                  controller: title,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Book Title',
                  ),
                ),
                TextField(
                  controller: author,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Book Author',
                  ),
                ),
                TextField(
                  controller: body,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Review Text',
                  ),
                ),
                
                ElevatedButton(
                  
                  onPressed: () {
                    DetaService().postThing(Review(author: author.text, body: body.text, reviewer: reviewer.text, title: title.text));
                    DetaService().fetchMessages();
                    
                  },
                  child: Text('post'),
                ),
              ],
            );
          },
        )
        
        );
  }
}