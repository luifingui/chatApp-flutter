import 'package:chat_app/widgets/witgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  const LogoLogin(
                    mensaje: 'Messenger',
                  ),
                  _Form(),
                  const LabelsLogin(
                    ruta: 'register',
                    textIngreso: 'Crea una ahora!', 
                    cuentaExistente:'No  tienes cuenta?',
                    
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
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
            text: 'Ingrese',
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
