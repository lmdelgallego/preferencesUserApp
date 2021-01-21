import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/pages/home_page.dart';
import 'package:preferences_user_app/src/pages/settings_page.dart';
import 'package:preferences_user_app/src/share_pref/preferenciass_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = new PreferenciasUsuario();
  await pref.initPref();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pref = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: pref.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
