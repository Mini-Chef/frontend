import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'BLE Scan & Connection Demo';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: PagAlimentador(),
    );
  }
}

class PagAlimentador extends StatefulWidget {
  const PagAlimentador({super.key});

  @override
  State<PagAlimentador> createState() => _PagAlimentadorState();
}

class _PagAlimentadorState extends State<PagAlimentador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 223, 250),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 102, 38, 187),
        title: const Text('Alimentador MiniChef'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Lola 8 anos yorkshire",
                              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                            ),
                          ),
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 102, 38, 187),
                            boxShadow: [
                              BoxShadow(color: Color.fromARGB(255, 22, 10, 29),)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10),),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(flex: 3,child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(Icons.settings, color: Colors.white),
                          ),
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 102, 38, 187),
                            boxShadow: [
                              BoxShadow(color: Color.fromARGB(255, 22, 10, 29),)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10),),
                          ),
                        ),)
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
