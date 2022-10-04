import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _formKey2 = GlobalKey<FormState>();
    final _formKey3 = GlobalKey<FormState>();

    int plate = 0;
    int n_meals = 0;
    int timedelta = 0;

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
                        width: 250,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Qtde por refeicao: 5 gramas'),
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
                    onPressed: (() {
                      //TODO requisicao
                      print(n_meals);
                    }),
                    child: const Text("Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Form(
                    key: _formKey3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 250,
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Intervalos refeição'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Can\'t be blank';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            timedelta = int.parse(value);
                          },
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 102, 38, 187),
                    ),
                    onPressed: (() {
                      //TODO requisicao
                      print(n_meals);
                    }),
                    child: const Text("Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
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
