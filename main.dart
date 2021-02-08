import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const String _title = 'iBus';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme:
      ThemeData(fontFamily: 'Raleway'),
      home: MyStatefulWidget(),
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State <MyStatefulWidget> {
  int _selectedIndex = 0;
  String _origenDir = "Dirección de origen";
  String _destinoDir = "Dirección de destino";
  String _name = "Nombre del lugar";
  String _ruta = "A 112";

  final TextStyle _colorText = const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  final TextStyle _mainHeading = const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _subtitle = const TextStyle(color: Colors.black, fontSize: 14);
  final TextStyle _idBus= const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

Widget _iconPlusHeading(nameIcon, labelTitle){
  return Container(
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(nameIcon, color: Colors.black),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: null,
        ),
        Text(labelTitle, style: _subtitle),
      ],
    ),
  );
}
Widget _optionsMenu() {
    return new PopupMenuButton(
        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
          new PopupMenuItem<int>(
              value: 1,
              child: new Text('Editar')),
          new PopupMenuItem<int>(
              value: 2,
              child: new Text('Eliminar')),
        ],
    );
 }
Widget _buttonRoute(colorHex){
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Color(colorHex),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(_ruta, style: _idBus),
  );
}
Widget _routeInfo(){
    return Column(
        children: <Widget>[
          Container(
            width: 250,
            alignment: Alignment.center,
            child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.trip_origin, color: Color(0xffFF1884)),
                      onPressed: null
                  ),
                  Container(
                    child: Column(
                        children: <Widget>[
                          Text(_name, style: _mainHeading),
                          Text(_origenDir , style: _subtitle),
                        ]
                    ),
                  ),
                ]
            )
          ),
          Container(
            width: 360,
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(0,40,0,10),
            child: Row(
              children: <Widget>[
                Container(
                  width: 250,
                  child: Column(
                      children: <Widget>[
                        Text(_name , style: _mainHeading),
                        _iconPlusHeading(Icons.person_pin_circle, _origenDir),
                        _iconPlusHeading(Icons.location_on_sharp,_destinoDir),
                      ]
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      _buttonRoute(0xffFF1884),
                      Container(
                        height: 6),
                      _buttonRoute(0xffFF7C18),
                    ],
                  ),
                ),
                _optionsMenu(),
              ],
            ),
          )
        ],
    );
}
String saveValue = "";
Widget _campoTexto1(label){
    return
      Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: TextField(
          onChanged: (texto) {
            saveValue = texto;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            labelText: label,
          ),
        ),

      );
}
  String value1 = "";
  Widget _campoTexto2(label){
    return
      Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: TextField(
          onChanged: (texto) {
            value1 = texto;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            hintText: label,
          ),
        ),

      );
  }
  String value2 = "";
  Widget _campoTextoIcon(iconName, label){
    return
      Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: TextField(
          onChanged: (texto) {
            value2 = texto;
          },
          decoration: InputDecoration(
            icon: Icon(iconName, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            hintText: label,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iBus', style: _colorText),
        backgroundColor: Color(0xffF0BE28),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            _routeInfo(),
            _campoTexto1("Destino"),
            _campoTexto2("Dirección de destino"),
            _campoTextoIcon(Icons.person_pin_circle,"Dirección de Origen"),
            _campoTextoIcon(Icons.location_on_sharp,"Dirección de Destino"),
            OutlineButton(
                onPressed: null,
                disabledBorderColor: Color(0xffF0BE28),
                child: Text("Añadir a favoritos", style: TextStyle(color: Color(0xffF0BE28))),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta_sharp, color: Colors.black),
            label: 'Viajes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_rounded, color: Colors.black),
            label: 'Pasajes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Mi cuenta',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffF0BE28),
        onTap: _onItemTapped,
      ),
    );
  }
}