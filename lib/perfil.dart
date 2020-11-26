import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:redia/core/presentation/res/assets.dart';
import 'package:redia/src/widgets/network_image.dart';

class Perfil extends StatelessWidget {
  static final String path = "lib/src/perfil.dart";
  final List<Map> catalogo = [
    {"title": "Tacos de asada", "image": tacos}, //meal
    {"title": "Costillas", "image": costillas},
    {"title": "Quesadillas", "image": quesadillas},
    {"title": "Aguas frescas", "image": aguas},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color(0xff9fb7bf), const Color(0xff3d6573)]),
            ),
          ),
          ListView.builder(
            itemCount: 7,
            itemBuilder: _mainListBuilder,
          ),
        ],
      ),
    );
  }

  Widget _mainListBuilder(BuildContext context, int index) {
    if (index == 0) return _buildHeader(context);
    if (index == 1) return _buildSectionHeader(context);
    if (index == 2) return _buildCollectionsRow();
    if (index == 3)
      return Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
          child: Text("Publicaciones",
              style: Theme.of(context).textTheme.title));
    return _buildListItem();
  }

  Widget _buildListItem() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: PNetworkImage(posts[0], fit: BoxFit.cover),
      ),
    );
  }

  Container _buildSectionHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Catálogo",
            style: Theme.of(context).textTheme.title,
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "Añadir",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  Container _buildCollectionsRow() {
    return Container(
      color: Colors.white,
      height: 200.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: catalogo.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              width: 150.0,
              height: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: PNetworkImage(catalogo[index]['image'],
                              fit: BoxFit.cover))),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(catalogo[index]['title'],
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .merge(TextStyle(color: Colors.grey.shade600)))
                ],
              ));
        },
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 240.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Taquería LCC",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("Comida mexicana"),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "3",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Publicaciones".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0)),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "2020",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Seguidores".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0)),
                          ),
                        ),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(avatar),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}