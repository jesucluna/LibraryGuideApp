import 'package:flutter/material.dart';
import 'package:libraryapp/default_pages/search.dart';

class SearchWidget extends StatelessWidget {
  final performSearch;

  const SearchWidget({Key key, this.performSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "LibraryGuideFree"),
                onSubmitted: (String info) {
                  if (info.isNotEmpty) {
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SearchScreen(quer: info)));
                  }
                },
              ),
            ),
            Icon(Icons.search, color: Colors.black54)
          ],
        ),
      ),
    );
  }
}
