import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Book {
  String ID;
  String title;
  String author;
  String content;
  String publisher_date;
  String pages;
  String cover;

  Book(
      [this.ID,
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
      Books.add(Book(i["ID"], i["title"], i["author"], i["content"],
          i["publisher_date"], i["pages"], i["cover"]));
    }
    books = Books;
    return books;
  }
}

class ShowBooks extends StatelessWidget {
  final Book book;
  ShowBooks(this.book);
  Widget _inkwelltemplate(String title, IconData icon, String idbook) {
    return FlatButton(
      onPressed: () {},
      child: Row(children: <Widget>[Text(title, style: TextStyle(color:Colors.deepPurpleAccent[700]),), Icon(icon, color:Colors.deepPurpleAccent[700])]),
    );
  }

  Widget _getFlbutt(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent[700],
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            actions: <Widget>[
              Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                _inkwelltemplate("Favoritos", Icons.favorite, book.ID),
                _inkwelltemplate("Pendientes", Icons.assignment, book.ID),
                _inkwelltemplate("Completados", Icons.check_circle, book.ID),
              ]))
            ],
          );
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return alertDialog;
              });
        });
  }

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
      floatingActionButton: _getFlbutt(context),
      /* FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (txt) => AlertDialog(
                  title: Text("Hola"),
                  content: Container(
                      child: ListView(
                    children: <Widget>[
                      _inkwelltemplate("Favoritos", Icons.favorite, book.ID),
                      _inkwelltemplate("Pendientes", Icons.assignment, book.ID),
                      _inkwelltemplate(
                          "Completados", Icons.check_circle, book.ID),
                    ],
                  ))));
        },
        backgroundColor: Colors.deepPurpleAccent[700],
        child: Icon(Icons.add),
      ),*/
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
