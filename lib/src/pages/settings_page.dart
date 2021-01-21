import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/share_pref/preferenciass_usuario.dart';
import 'package:preferences_user_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textEditingController;
  final pref = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _genero = pref.genero;
    _colorSecundario = pref.colorSecundario;
    _textEditingController = new TextEditingController(text: pref.nombre);
  }

  void _setSelectedRadio(int value) {
    pref.genero = value;
    _genero = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias'),
        backgroundColor:
            (pref.colorSecundario) ? Colors.amber : Colors.deepPurple,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(0.5),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value) {
              pref.colorSecundario = value;
              _colorSecundario = value;
              setState(() {});
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona que esta usando el telefono',
              ),
              onChanged: (value) {
                pref.nombre = value;
              },
            ),
          )
        ],
      ),
    );
  }
}
