import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_app/screen/screen_descripcion.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final List<Map<String, String>> listaMotos = [
    {"nombre": "YAMAHA MT-07", "imagen": "images/MT-07.webp"},
    {"nombre": "YAMAHA MT-09", "imagen": "images/MT-09.webp"},
    {"nombre": "KAWAZAKI Z-900", "imagen": "images/Z-900.webp"},
    {"nombre": "KAWAZAKI ZH2", "imagen": "images/ZH2.webp"},
    {"nombre": "KAWAZAKI Z-1000", "imagen": "images/Z-1000.webp"},
    {"nombre": "KAWAZAKI H2R", "imagen": "images/H2R.webp"},
    {"nombre": "BMW S1000RR", "imagen": "images/S1000RR.webp"},
    {"nombre": "BMW M1000RR", "imagen": "images/S1000RR.webp"},
    {"nombre": "DUCATI PANIGALE", "imagen": "images/DUCATI-PANIGALE.webp"},
    {"nombre": "KAWAZAKI NINJA Z-10", "imagen": "images/NINJA-X-10.webp"},
    {"nombre": "DUCATI MULTIESTRADA", "imagen": "images/MULTIESTRADA.webp"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        flexibleSpace: Column(
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.transparent,
            ),
            Expanded(child: Container(color: Color(0xFF272727))),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Centro de MOTOS',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.motorcycle_rounded, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: listaMotos.length,
        itemBuilder: (context, index) {
          final listaMoto = listaMotos[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ListTile(
              leading: Icon(Icons.motorcycle_rounded),
              trailing: Icon(Icons.sports_motorsports_outlined),
              title: Text("${listaMoto["nombre"]}"),
              subtitle: Text("Id moto: ${index + 1}"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      "Moto ${listaMoto["nombre"]}",
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Image.asset(
                      "${listaMoto["imagen"]}",
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ScreenDescripcion(listMotos: listaMotos),
                            )
                          );
                        },
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.black54,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.cancel_outlined, color: Colors.white),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.black54,
                          ),
                        ),
                      ),
                    ],
                    backgroundColor: Colors.grey,
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[300],
            height: 2,
            indent: 17,
            endIndent: 17,
          );
        },
      ),
    );
  }
}
