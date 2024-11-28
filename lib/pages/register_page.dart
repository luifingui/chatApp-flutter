import 'package:flutter/material.dart';
import 'package:chat_app/widgets/witgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LogoLogin(mensaje: 'Registro'),
                  _Form(),
                  const LabelsLogin(
                    ruta: 'register',
                    textIngreso: 'Ingresar con cuenta existente', 
                    cuentaExistente: 'Ya tienes cuenta?',
                  ),
                  const Text(
                    'Terminos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            hintText: 'Nombre',
            prefix: Icons.perm_identity,
            texController: nameCtrl,
            tipoTeclado: TextInputType.text,
          ),
          CustomInput(
            hintText: 'Email',
            prefix: Icons.mail_outlined,
            texController: emailCtrl,
            tipoTeclado: TextInputType.emailAddress,
          ),
          CustomInput(
            hintText: 'Password',
            prefix: Icons.lock,
            texController: passCtrl,
            isPassword: true,
            tipoTeclado: TextInputType.text,
          ),
          BotonAzulLogin(
            text: 'Registrar',
            onPressed: () {
              print(emailCtrl.text);
              print(passCtrl.text);
            },
          )
        ],
      ),
    );
  }
}
