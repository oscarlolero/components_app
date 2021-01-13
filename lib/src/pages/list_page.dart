import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/widgets.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listNum = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _add10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(children: [
        _createList(),
        _createLoading()
      ]),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getFirstPage,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          final image = _listNum[index];
          return FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://picsum.photos/id/$image/500/400'),
          );
        },
        itemCount: _listNum.length,
      ),
    );
  }

  Future<Null> _getFirstPage() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listNum.clear();
      _lastItem++;
      _add10();
    });
    return Future.delayed(duration);
  }
  void _add10() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _listNum.add(_lastItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, _responseHTTP);
  }

  void _responseHTTP() {
    _isLoading = false;
    _add10();
    _scrollController.animateTo(_scrollController.position.pixels + 100, duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
  }

  Widget _createLoading() {
    if(_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15)
        ],
      );
    } else {
      return Container();
    }
  }
}
