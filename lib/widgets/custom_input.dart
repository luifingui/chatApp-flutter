import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInput extends StatelessWidget {
  final String hintText;
  final IconData prefix;
  final TextEditingController texController;
  final bool isPassword;
  final TextInputType tipoTeclado;

  const CustomInput({
    super.key,
    required this.hintText,
    required this.prefix,
    required this.texController,
    this.tipoTeclado = TextInputType.text,
    this.isPassword = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 5),
                blurRadius: 5
            )
          ]),
      child: TextField(
        controller: texController,
        autocorrect: false,
        keyboardType: tipoTeclado,
        obscureText: isPassword ,
        decoration: InputDecoration(
            prefixIcon: Icon(prefix),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: hintText
        ),
      ),
    );
  }
}
