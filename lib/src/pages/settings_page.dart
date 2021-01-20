import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);
  static final String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias'),
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Text('Ajustes Page'),
      ),
    );
  }
}
