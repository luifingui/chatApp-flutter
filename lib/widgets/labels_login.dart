import 'package:flutter/material.dart';

class LabelsLogin extends StatelessWidget {

  final String ruta;
  final String textIngreso;
  final String cuentaExistente;


  const LabelsLogin({super.key, required this.ruta, required this.textIngreso, required this.cuentaExistente});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            cuentaExistente,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Text(
              textIngreso,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, ruta);
            },
          )
        ],
      ),
    );
  }
}
