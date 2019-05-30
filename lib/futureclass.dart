import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Book {
  String id;
  String title;
  String author;
  String content;
  String publisher_date;
  String pages;
  String cover;

  Book(
      [this.id,
      this.title,
      this.author,
      this.content,
      this.publisher_date,
      this.pages,
      this.cover]);
}

class Data {
  static List<Book> books = List<Book>();
  static Future<List<Book>> getBooks(String query) async {
    var Books = List<Book>();
    var bookData;
    if(query == null){
      query="since=last_year";
      bookData =
        await http.get('http://www.etnassoft.com/api/v1/get/?$query');
    }else{
      String nquery="book_title=$query";
      bookData= await http.get('http://www.etnassoft.com/api/v1/get/?$nquery');
    }
    
    var nbookData = bookData.body;
    List<String> rplace = ["(",")",";","&#039s","ul&gt","&ltul&gt","&lt/li&gt","&rsquos","&ndash","&lt","li&gt","&mdash"];
    for (var i in rplace){
       nbookData =nbookData.replaceAll(i,"");
    }
    var please = nbookData;
    var jsonData = jsonDecode(please);
    for (var i in jsonData) {
      Books.add(Book(i["id"], i["title"], i["author"], i["content"],
          i["publisher_date"], i["pages"], i["cover"]));
    }
    books = Books;
    return books;
  }
}

class ShowBooks extends StatelessWidget {
  final Book book;
  ShowBooks(this.book);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book.title,
        ),
        backgroundColor: Colors.deepPurpleAccent[700],
      ),
      body: Container(

        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Image.network(
              book.cover,
              height: 350.0,
              width: 350.0,
              alignment: Alignment.topLeft,
              
            ),
            //Divider(),
            Text("\n${book.title}"),
            Text("\n\tAutor: ${book.author}"),
            Text("\n\tPaginas: ${book.pages}"),
            Text("\n\tFecha de publicación: ${book.publisher_date}\n"),
            Text(book.content),
            
            
          ],
        ),
      ),
    );
  }
}
