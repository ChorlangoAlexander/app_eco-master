import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class AddPossScreen extends StatefulWidget {
  AddPossScreen({Key? key}) : super(key: key);

  @override
  State<AddPossScreen> createState() => _AddPossScreenState();
}

class _AddPossScreenState extends State<AddPossScreen> {
  File? image;

  selectImage(parentContex) {
    return showDialog(
        context: parentContex,
        builder: (context) {
          return SimpleDialog(
            title: Text('Crear una Publicaión'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Abrir la Camara'),
                onPressed: () async {
                  final XFile? image =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                },
              ),
              SimpleDialogOption(
                  child: Text('Abrir la Galeria'),
                  onPressed: () async {
                    final XFile? image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                  }),
              SimpleDialogOption(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Container buildSplashScreen() {
    return Container(
      color: Colors.green[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
              'assets/upl.svg',
              height: 260.0,
              width: 300.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Cargar Imagen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              color: Colors.green,
              onPressed: () {
                selectImage(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  buildUploadScreen() {
    return print('Archivo cargado');
  }

  @override
  Widget build(BuildContext context) {
    return image == null ? buildSplashScreen() : buildUploadScreen();
  }
}
