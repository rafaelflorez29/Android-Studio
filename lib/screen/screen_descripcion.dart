import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenDescripcion extends StatelessWidget{
  final List listMotos;
  const ScreenDescripcion({super.key,required this.listMotos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: listMotos.length,
        itemBuilder: (context, index) {
          final listMoto = listMotos[index];
          return ListTile(
            title: Text("${listMoto["nombre"]}"),
          );
      },),
    );
  }
}

