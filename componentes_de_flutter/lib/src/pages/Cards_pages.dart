import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cards"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            _listaDeCartas(),
            Divider(
              height: 20,
            ),
            _listaDeCartas2(),
          ],
        ));
  }

  Widget _listaDeCartas() {
    return Card(
      child: Column(children: [
        ListTile(
          leading: Icon(Icons.map_outlined),
          title: Text("Este es el titulo"),
          subtitle: Text("Aprendiendo flutter"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: const Text("Presionar")),
            TextButton(onPressed: () {}, child: const Text("Cancelar"))
          ],
        )
      ]),
    );
  }

  _listaDeCartas2() {
    return Column(
      children: [
        Card(
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage(
                "https://images.pexels.com/photos/2286895/pexels-photo-2286895.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Text("No se que poner aqui"),
        )
      ],
    );
  }
}
