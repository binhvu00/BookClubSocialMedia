

class Review{
  final String author;
  final String body;
  final String reviewer;
  final String title;

  Review({
    required this.author, 
    required this.body, 
    required this.reviewer, 
    required this.title,});



factory Review.fromJson(Map<String, dynamic> json){
  return Review(
    author: json['author'].toString(),
    body: json['body'].toString(),
    reviewer: json['reviewer'],
    title: json['title']
  );
  }
  Map<String, dynamic> toJson() => {
    'author': author,
    'body': body,
    'reviewer': reviewer,
    'title': title,
  };
}