import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('alert page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta'),
          onPressed: () => _showAlert(context),
          textColor: Colors.white,
          color: Colors.blue,
          shape: StadiumBorder(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('asdasd'),
              FlutterLogo(size: 100,)
            ],
          ),

          actions: [
            FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancelar')),
            FlatButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text('Ok')),
          ],
        );
      }
    );
  }
}