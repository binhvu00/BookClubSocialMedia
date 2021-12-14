import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_6/deta.dart';
import 'dart:convert';

import 'package:project_6/review.dart';

void runPostTest() async {
  final review = Review(author: 'Dumas', body: 'Good', reviewer: 'Binh', title: 'Count of Monte Cristo');
  await DetaService().postThing(review).then((response) {
    print(response.toString());
  
  });
}

void makeManyPosts() async {
  final values = ['Good', 'Good1', 'Good2', 'Good4', 'Good5'];
  for (var element in values) {
    await DetaService().postThing(Review(author:"Dumas", body:element, reviewer:"Binh", title:"russell manyposts"))
        .then((response) => print(response.toString()));
  }
}

void queryPosts() async {
  await DetaService().fetchMessages().then(
    (response) {
      final wrapper = jsonDecode(response.body);
      print(wrapper);
      final list = wrapper['items'];
      final posts = list.map((e) => Review.fromJson(e)).toList();
      print(posts.length);
      print(posts[1].message);
    },
  );
}

void main() {
  test('that the post occurs', runPostTest);

  test('many posts', makeManyPosts);

  test('query posts', queryPosts);
}
