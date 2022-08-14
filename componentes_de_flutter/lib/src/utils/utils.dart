import 'package:flutter/material.dart';

final listDeIconos = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "text_fields": Icons.text_fields,
  "tune": Icons.tune,
  "list": Icons.list,
};

Icon getIcon(String nombreIcono) {
  return Icon(listDeIconos[nombreIcono]);
}
