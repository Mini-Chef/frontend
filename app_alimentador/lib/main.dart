import 'package:app_alimentador/ConfigPage.dart';
import 'package:app_alimentador/mock.dart';
import 'package:app_alimentador/net/globals.dart';
import 'package:app_alimentador/net/net_helper.dart';
import 'package:app_alimentador/widgets/cartao_animal.dart';
import 'package:app_alimentador/widgets/cartao_dados.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'BLE Scan & Connection Demo';

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: const PagAlimentador(),
    );
  }
}

class PagAlimentador extends StatefulWidget {
  const PagAlimentador({super.key});

  @override
  State<PagAlimentador> createState() => _PagAlimentadorState();
}

class _PagAlimentadorState extends State<PagAlimentador> {
  var sensors = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sensors = mock_sensor; 
    updateUI();
  }

  void updateUI() async {
    // var sensors = await networkHelper.getData("sensor");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    NetworkHelper networkHelper = NetworkHelper(url_base);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 223, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 102, 38, 187),
        title: const Text('Alimentador MiniChef'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 8,
                          child: CartaoAnimal(
                            nome: "Lola yorkshire, 8 anos",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: (() async {
                              sensors = await networkHelper.getData("sensor");
                              updateUI();
                            }),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 102, 38, 187),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 22, 10, 29),
                                  )
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child:
                                    Icon(Icons.refresh, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return const ConfigPage();
                                }),
                              );
                            }),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 102, 38, 187),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 22, 10, 29),
                                  )
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child:
                                    Icon(Icons.settings, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  CartaoDados(label: "Refeições\n por dia", dados: "${sensors['data']['meals']}"),
                  CartaoDados(label: "Umidade\n alimentador", dados: "${sensors['data']['humidity']}%"),
                  CartaoDados(label: "Temperatura\n interna", dados: "${sensors['data']['temp']}°C")
                ]),
          ),
        ),
      ),
    );
  }
}
