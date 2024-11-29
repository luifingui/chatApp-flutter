import 'package:chat_app/models/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
    Usuarios(uid: '1',nombre: 'Deiner caraballo', email: 'Deinercd21@gmail.com',online: true),
    Usuarios(uid: '2',nombre: 'Luifer de aguas', email: 'luifer@gmail.com',online: true),
    Usuarios(uid: '3',nombre: 'el ché', email: 'cheboludo@gmail.com',online: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi nombre',
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.exit_to_app)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            // child: Icon(Icons.check_circle, color: Colors.blue[400]) ,
            child: const Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header:  WaterDropHeader(
          complete: Icon(Icons.check, color:Colors.blue[400]),
          waterDropColor:Colors.blue[400]!,
        ),
        child:_listViewUsuarios(),
      
      )
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: usuarios.length,
      itemBuilder: ( _, index) => _usuarioListTile(usuarios[index]) , 
      separatorBuilder: (_, int index)=> const Divider(),
    );
  }

  ListTile _usuarioListTile(Usuarios usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(usuario.nombre.substring(0,2)),
        ),
        trailing: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }

  _cargarUsuarios()async{
     
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();

  }

}