import 'package:flutter/material.dart';

class CartaoAnimal extends StatelessWidget {
  const CartaoAnimal({Key? key, required this.nome}) : super(key: key);

  final String nome;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            nome,
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
