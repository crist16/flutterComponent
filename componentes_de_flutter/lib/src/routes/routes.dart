import 'package:componentes_de_flutter/src/pages/Cards_pages.dart';
import 'package:componentes_de_flutter/src/pages/Lista_page.dart';
import 'package:flutter/material.dart';

import '../pages/Alertas_pages.dart';
import '../pages/Avatars_pages.dart';
import '../pages/Componentes.dart';
import '../pages/Inputs_page.dart';
import '../pages/Slider_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => Componentes(),
    "avatar": (BuildContext context) => const Avatar(),
    "alert": (BuildContext context) => const Alertas(),
    "card": (BuildContext context) => const Cards(),
    "inputs": (BuildContext context) => const InputPage(),
    "slider": (BuildContext context) => const SliderPage(),
    "list": (BuildContext context) => const ListaBuilder(),
  };
}
