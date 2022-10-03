import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});


  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();



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
            children: [TextField(
              
            )],
          ),
        ),
      ),
    );
  }
}
