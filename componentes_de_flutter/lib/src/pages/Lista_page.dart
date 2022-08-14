import 'dart:async';

import 'package:flutter/material.dart';

class ListaBuilder extends StatefulWidget {
  const ListaBuilder({Key? key}) : super(key: key);

  @override
  State<ListaBuilder> createState() => _ListaBuilderState();
}

class _ListaBuilderState extends State<ListaBuilder> {
  List<int> listaDeItems = [];
  bool _isLoading = false;
  ScrollController _scrollController = new ScrollController();
  int ultimoItem = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("llego al final");
        //_agregar10();
        fetchData();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lista Builder")),
        body: Stack(
          children: [_listaBuilder(), _creaLoading()],
        ));
  }

  _listaBuilder() {
    return RefreshIndicator(
      onRefresh: lista1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: listaDeItems.length,
        itemBuilder: (BuildContext context, int index) {
          final lisDeItemFinal = listaDeItems[index];
          return FadeInImage(
              placeholder: AssetImage("assets/jar-loading.gif"),
              image: NetworkImage(
                  "https://picsum.photos/id/$lisDeItemFinal/200/300"));
        },
      ),
    );
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      listaDeItems.add(ultimoItem++);
      print("Llamando10");
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHttp);
  }

  respuestaHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    print("llamnado nuevos 10");
    _agregar10();
    print(_isLoading);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  _creaLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> lista1() {
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, () {
      listaDeItems.clear();
      ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duracion);
  }
}
