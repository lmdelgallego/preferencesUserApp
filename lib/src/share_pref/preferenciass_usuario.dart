import 'package:preferences_user_app/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();
  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPref() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // Ninguna de estas propiedades se usa
  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  // GET and SETS
  get genero {
    return this._prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    this._prefs.setInt('genero', value);
  }

  get colorSecundario {
    return this._prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    this._prefs.setBool('colorSecundario', value);
  }

  get nombre {
    return this._prefs.getString('nombre') ?? 'Usuario';
  }

  set nombre(String value) {
    this._prefs.setString('nombre', value);
  }

  get lastPage {
    return this._prefs.getString('lastPage') ?? HomePage.routeName;
  }

  set lastPage(String value) {
    this._prefs.setString('lastPage', value);
  }
}
