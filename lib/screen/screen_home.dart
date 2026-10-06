import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final listaMotos = [
    {"nombre": "YAMAHA MT-07", "imagen": "images/MT-07.webp"},
    {"nombre": "YAMAHA MT-09", "imagen": "images/MT-09.webp"},
    {"nombre": "KAWAZAKI Z-900", "imagen": "images/Z-900.webp"},
    {"nombre": "KAWAZAKI ZH2", "imagen": ""},
    {"nombre": "KAWAZAKI Z-1000", "imagen": ""},
    {"nombre": "KAWAZAKI H2R", "imagen": ""},
    {"nombre": "BMW S1000RR", "imagen": ""},
    {"nombre": "BMW M1000RR", "imagen": "https://imgs.search.brave.com/A-Lom5z6LScQsddBdqiF71RKeY607x7LK8RhUJoRNvg/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly93d3cu/Y2Fyb2xlbmFzaC5j/b20vaW1hZ2VzL2xp/YnJhcmllc3Byb3Zp/ZGVyNi9ibG9nLXBv/c3RzL2Jtdy1tMTAw/MHJyMi5qcGc_c2Z2/cnNuPWMxMjBjZGIz/XzE"},
    {"nombre": "DUCATI PANIGALE", "imagen": "https://imgs.search.brave.com/5RgL1WJF2ObcGNlHZLm9KQO8mDZUBtKU24xv7cUSEBE/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9zMS5j/ZG4uYXV0b2V2b2x1/dGlvbi5jb20vaW1h/Z2VzL21vdG9fbW9k/ZWxzL0RVQ0FUSV9Q/YW5pZ2FsZS1WMi0y/MDIzX21haW4uanBn"},
    {"nombre": "KAWAZAKI NINJA Z-10", "imagen": "https://imgs.search.brave.com/M6f9a8byueFraBr6KYymJahQRrWUR9JNRWLUnejir8Y/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly93d3cu/bGF6ZXJoZWxtZXRz/Lm5ldC93cC1jb250/ZW50L3VwbG9hZHMv/MjAyMy8wMy9OaW5q/YS1aWC0xMFItbGlm/ZXN0eWxlLTEuanBn"},
    {"nombre": "DUCATI MULTIESTRADA", "imagen": "https://imgs.search.brave.com/5_2pj-RlzW3q-q-sU3SELxocwRFI-RHYCf_LDM6A_nI/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4t/ZmFzdGx5Lm1vdG9y/Y3ljbGUuY29tL21l/ZGlhLzIwMjQvMDkv/MTkvMTYyOTEvcy1w/b3N0LmpwZz9zaXpl/PTcyMHg4NDUmbm9j/cm9wPTE"},
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
                    title: Text("Moto ${listaMoto["nombre"]}", style: TextStyle(color: Colors.white),),
                    content: Image.asset("${listaMoto["imagen"]}",height: 100,fit: BoxFit.contain),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.cancel_outlined,color: Colors.white,),
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
