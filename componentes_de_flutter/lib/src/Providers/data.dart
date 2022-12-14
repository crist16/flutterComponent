import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final data = await rootBundle.loadString('data/menu_opts.json');
    Map mydata = json.decode(data);
    final opciones = mydata["rutas"];
    return opciones;
  }
}

final menuProvider = _MenuProvider();
