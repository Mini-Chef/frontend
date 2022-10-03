import 'package:flutter/material.dart';

class CartaoDados extends StatelessWidget {
  const CartaoDados({Key? key, required this.label, required this.dados})
      : super(key: key);

  final String dados;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
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
          child: Row(children: [
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                dados,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,

              ),
            )
          ]),
        ),
      ),
    );
  }
}
