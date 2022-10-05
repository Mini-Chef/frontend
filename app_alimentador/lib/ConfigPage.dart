import 'package:app_alimentador/mock.dart';
import 'package:app_alimentador/net/globals.dart';
import 'package:app_alimentador/net/net_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  NetworkHelper networkHelper = NetworkHelper(url_base);
  Map configs = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    configs = mock_config; 
    updateUI();
  }

  void updateUI() async {
    // var getData = await networkHelper.getData("config");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _textEditingController = TextEditingController();
    int horas = 0;
    int minutos = 0;
    int plate = 0;
    List<Text> seletorHora = [for (var i = 1; i <= 23; i++)
                        Text("$i"),];
    List<Text> seletorMinuto = [for (var i = 1; i <= 59; i++)
                          Text("$i"),];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 223, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 102, 38, 187),
        title: const Text('Alimentador MiniChef'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 240,
                        child: TextFormField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                              labelText:
                                  'Qtde por refeicao: ${configs['data']['plate']} gramas'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Can\'t be blank';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            plate = int.parse(value);
                          },
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 102, 38, 187),
                    ),
                    onPressed: (() async {
                      var body = {"data": plate};
                      configs['data']['plate'] = plate;
                      // await networkHelper.postData("plate", body);
                      updateUI();
                      print(body);
                      _textEditingController.clear();
                    }),
                    child: const Text("Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(child: Text("Intervalo atual: ${configs['data']['delay']['h']}h${configs['data']['delay']['m']}min"),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Horas", style: TextStyle(fontSize: 18),),
                      Container(
                          height: 80,
                          width: 125,
                          child: CupertinoPicker(
                              itemExtent: 40.0,
                              onSelectedItemChanged: (int value) =>
                                  horas = int.parse(seletorHora[value].data!),
                              children: seletorHora),),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Minutos", style: TextStyle(fontSize: 18),),
                      Container(
                          height: 80,
                          width: 125,
                          child: CupertinoPicker(
                              itemExtent: 40.0,
                              onSelectedItemChanged: (int value) =>
                                  minutos = int.parse(seletorMinuto[value].data!),
                              children: seletorMinuto),),
                    ],
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 102, 38, 187),
                    ),
                    onPressed: (() async {
                      var body = {
                        "data": {"h": horas, "m": minutos}
                      };
                      configs['data']['delay']['h'] = horas;
                      configs['data']['delay']['m'] = minutos;
                      // await networkHelper.postData("plate", body);
                      updateUI();
                      print(body);
                    }),
                    child: const Text("Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
