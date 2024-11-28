import 'package:flutter/material.dart';

class BotonAzulLogin extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const BotonAzulLogin({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: const StadiumBorder(),
          backgroundColor: Colors.blue),
      child:  SizedBox(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
            ),
          )),
    );
  }
}
