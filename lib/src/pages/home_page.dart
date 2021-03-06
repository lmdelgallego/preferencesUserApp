import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/share_pref/preferenciass_usuario.dart';
import 'package:preferences_user_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final pref = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    pref.lastPage = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor:
            (pref.colorSecundario) ? Colors.amber : Colors.deepPurple,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: ${pref.colorSecundario}'),
          Divider(),
          Text('Genero: ${pref.genero}'),
          Divider(),
          Text('Nombre Usuario: ${pref.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
