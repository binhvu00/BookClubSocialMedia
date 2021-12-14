import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'review.dart';
import 'envelope.dart';
import 'deta.dart';
 

 
class HomeScreen extends StatefulWidget {
 HomeScreen({Key? key, required this.title}) : super(key: key);
 
 
 final String title;
 
 @override
 State<HomeScreen> createState() => HomeScreenState();
}
 
 
class HomeScreenState extends State<HomeScreen> {
  var _posts = [];
 
 
 _fetchPosts() async {
   final url = 'https://database.deta.sh/v1/b0nwc6hd/tldr/query';
   final uri = Uri.parse(url);
   final headers = {'X-API-Key': 'b0nwc6hd_tWSS1TeWchacsya99DTFe8hPPVxNq1HA', 'Content-Type': 'application/json'};
   final response = await http.post(uri, headers: headers, body: '{}');
   if (response.statusCode == 200) {
     final data = json.decode(response.body) as Map<String, dynamic>;
     final data2 = data['items'] as List<dynamic>;
     setState(() {
       _posts = data2.map((rawPost) {
         return Review.fromJson(rawPost);
       }).toList();
     });
   } else {
     throw Exception('error fetching posts');
   }
 }
 
  
   HomeScreenState() {
     _fetchPosts();

   }
 
 @override
 Widget build(BuildContext context) {
  
   return Scaffold(
     
     body: Center(
      
       child: ListView.builder(
         
         itemCount: _posts.length, 
         itemBuilder: (ctx, index){
           final item = _posts[index]; 
           final String dimension = '303';
           return ListTile(
             leading: CircleAvatar(
               backgroundImage: NetworkImage('https://placekitten.com/200/$dimension'),
             ),
             title: Text(item.title),
             subtitle: Text(item.body),
            
           );
          
    
         },
       ),
      
      
     ),
   );
}
}