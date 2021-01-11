// import 'package:flutter/material.dart';
//
// class HomePageTemp extends StatelessWidget {
//   final opciones = ['Uno', 'Dos', 'Tres', 'Cuadro', 'Cinco'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Componentes temp'),
//       ),
//       // body: ListView(children: _createItems()),
//       body: ListView(children: _shortItemsCreation()),
//     );
//   }
//
//   List<Widget> _createItems() {
//     List<Widget> lista = new List<Widget>();
//
//     for (String opt in opciones) {
//       final tempWidget = ListTile(
//         title: Text(opt),
//       );
//
//       lista..add(tempWidget)
//            ..add(Divider());
//     }
//
//     return lista;
//   }
//
//   List<Widget> _shortItemsCreation() {
//
//     return opciones.map((item) {
//       return Column(
//         children: [
//           ListTile(
//             title: Text(item),
//             subtitle: Text('Cualquier cosa'),
//             leading: Icon(Icons.ac_unit),
//             trailing: Icon(Icons.keyboard_arrow_right),
//             onTap: () {},
//           ),
//           Divider()
//         ],
//       );
//     }).toList();
//   }
// }
