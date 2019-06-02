import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
    if (query == null) {
      query = "since=last_year";
      bookData = await http
          .get('http://www.etnassoft.com/api/v1/get/?$query&num_items=20');
    } else {
      String nquery = "keyword=$query";
      bookData = await http
          .get('http://www.etnassoft.com/api/v1/get/?$nquery&num_items=30');
    }

    var nbookData = bookData.body;
    List<String> rplace = [
      "(",
      ")",
      ";",
      "&#039s",
      "ul&gt",
      "&ltul&gt",
      "&lt/li&gt",
      "&rsquos",
      "&ndash",
      "&lt",
      "li&gt",
      "&mdash",
      "&ldquo",
      "amp",
      "&Psi",
      "i&gt",
      "/i&gt",
      "strong&gt",
      "&quot",
      "&iquest",
      "&rdquo",
      "&laquo",
      "&raquo",
      "&#039"
    ];
    for (var i in rplace) {
      nbookData = nbookData.replaceAll(i, "");
    }
    nbookData = nbookData.replaceAll("&aacute", "á");
    nbookData = nbookData.replaceAll("&eacute", "é");
    nbookData = nbookData.replaceAll("&iacute", "í");
    nbookData = nbookData.replaceAll("&oacute", "ó");
    nbookData = nbookData.replaceAll("&uacute", "ú");
    nbookData = nbookData.replaceAll("&ntilde", "ñ");
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
        padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 60),
        child: ListView(
          children: <Widget>[
            Image.network(
              book.cover,
              height: 350.0,
              width: 350.0,
              alignment: Alignment.center,
            ),
            Text(
              "\n${book.title}",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Divider(
              color: Colors.black,
            ),
            Text("\n\tAutor(es): ${book.author}",
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            Text("\tPaginas: ${book.pages}",
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            Text("\tPublicación: ${book.publisher_date}\n",
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            Divider(
              color: Colors.black,
            ),
            Text(
              "\n${book.content}",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton.extended(
            icon: Icon(Icons.favorite),
            label: Text("Favoritos", style: TextStyle(fontSize: 9),),
            onPressed: () {},
            backgroundColor: Colors.deepPurpleAccent[700],
            heroTag: "btn1",
            //materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
          FloatingActionButton.extended(
            icon: Icon(Icons.assignment),
            label: Text("Pendientes", style: TextStyle(fontSize: 9),),
            onPressed: () {},
            backgroundColor: Colors.deepPurpleAccent[700],
            heroTag: "btn2",
          ),
          FloatingActionButton.extended(
            icon: Icon(Icons.check),
            label: Text("Termindados", style: TextStyle(fontSize: 9),),
            onPressed: () {},
            backgroundColor: Colors.deepPurpleAccent[700],
            heroTag: "btn3",
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
