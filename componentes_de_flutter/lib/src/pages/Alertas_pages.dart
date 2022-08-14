import 'package:flutter/material.dart';

class Alertas extends StatelessWidget {
  const Alertas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alertas page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Mostrar alerta"),
          onPressed: () => _mostraPopup(context),
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(), primary: Colors.red),
        ),
      ),
    );
  }

  void _mostraPopup(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text("Titulo de alerta"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Contenido del alert"),
                FlutterLogo(
                  size: 100.00,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancelar"))
            ],
          );
        });
  }
}
