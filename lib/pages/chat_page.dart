import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focuNode = FocusNode();
  bool _estaEscribiendo = false;

  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              maxRadius: 15,
              child: const Text(
                'LD',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              'Luifer de aguas',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (_, index) => _messages[index],
              reverse: true,
            )),

            const Divider(height: 1),
            //TODO: caja de texto
            Container(
              color: Colors.white,
              height: 50,
              child: _inputchat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputchat() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted:
                _handleSubmit, // Llama a la función al presionar "Enter"
            textInputAction: TextInputAction.send,
            onChanged: (texto) {
              setState(() {
                if (texto.trim().length > 0) {
                  _estaEscribiendo = true;
                } else {
                  _estaEscribiendo = false;
                }
              });
            }, // Cambia el botón del teclado a "Enviar"
            decoration: const InputDecoration.collapsed(
              hintText: 'Escribe un mensaje...',
            ),
            focusNode: _focuNode, // Mantiene el control del foco
          )),

          //!Boton de enviar
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
                  ? CupertinoButton(
                      onPressed: _estaEscribiendo
                          ? () => _handleSubmit(_textController.text.trim())
                          : null,
                      child: const Text('Enviar'),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                            onPressed: _estaEscribiendo
                                ? () =>
                                    _handleSubmit(_textController.text.trim())
                                : null,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            icon: const Icon(
                              Icons.send,
                            )),
                      ),
                    ))
        ],
      ),
    ));
  }

  void _handleSubmit(String texto) {
    if (texto.isEmpty) return; // Si el texto está vacío, no hace nada

    print('Texto enviado: $texto'); // Imprime el texto en la consola

    _textController.clear(); // Limpia el campo de texto

    _focuNode.requestFocus(); // Mantiene el foco en el TextField

    final newmessage = ChatMessage(
      texto: texto,
      uid: "1",
      animationController: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 100)),
    );

    _messages.insert(0, newmessage);
    newmessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: off del socket

    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
