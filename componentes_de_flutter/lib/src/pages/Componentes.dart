import 'package:componentes_de_flutter/src/Providers/data.dart';
import 'package:componentes_de_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';

class Componentes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Componentes")),
      body: _listaDeDatos(),
    );
  }

  Widget _listaDeDatos() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(children: _tilesDeDatos(snapshot.data, context));
      },
    );
  }

  List<Widget> _tilesDeDatos(List<dynamic> data, BuildContext context) {
    return data.map((e) {
      return ListTile(
        title: Text(e["texto"]),
        leading: getIcon(e["icon"]),
        trailing: const Icon(Icons.zoom_in_map_sharp),
        onTap: () => {Navigator.pushNamed(context, e["ruta"])},
      );
    }).toList();
  }
}
