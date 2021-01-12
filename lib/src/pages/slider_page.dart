import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(children: [
          _createSlider(),
          _createCheckbox(),
          _createSwitch(),
          _createImage(),
        ]),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: _blockCheck ? null : (value) {
        setState(() {
          _sliderValue = value;
        });
      },
    );
  }

  Widget _createImage() {
    return Expanded(
      child: AnimatedContainer(
        width: _sliderValue,
        duration: Duration(milliseconds: 100),
        child: Image(
            image: NetworkImage(
                'https://static.vecteezy.com/system/resources/thumbnails/000/246/312/original/mountain-lake-sunset-landscape-first-person-view.jpg'),
            fit: BoxFit.contain),
      ),
    );
  }

  Widget _createCheckbox() {
    // return Checkbox(
    //   value: _blockCheck,
    //   onChanged: (value) {
    //     setState(() {
    //       _blockCheck = value;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }
}
