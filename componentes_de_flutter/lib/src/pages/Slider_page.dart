import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 20.0;
  bool? _checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Page"),
      ),
      body: Column(
        children: [
          Container(
            child: _barraSlider(),
          ),
          _crearCheckbox()
        ],
      ),
    );
  }

  Widget _barraSlider() {
    return Slider(
        min: 10.0,
        max: 100.0,
        value: _valorSlider,
        onChanged: _checkValue == false
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  _crearCheckbox() {
    return CheckboxListTile(
        title: const Text("Activar"),
        value: _checkValue,
        onChanged: (valor) {
          setState(() {
            _checkValue = valor;
          });
        });
  }
}
