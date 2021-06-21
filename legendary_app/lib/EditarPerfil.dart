import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'RouteGenerator.dart';
import 'dart:io';

class EditarPerfilPageView extends StatefulWidget {
  @override
  _EditarPerfilPageViewState createState() => _EditarPerfilPageViewState();
}

class _EditarPerfilPageViewState extends State<EditarPerfilPageView> {
  late File imageFile;
  final picker = ImagePicker();
  bool isImagePicked = false;

  chooseImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile == null) {
        print('Nenhuma imagem foi selecionada');
      } else {
        isImagePicked = true;
        imageFile = File(pickedFile.path);
        print('A imagem foi selecionada');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_CADASTRARIMAGEM);
            }),
        title: Text('Editar Perfil'),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 90,
                      backgroundColor: Colors.grey,
                      child: ClipOval(
                        child: new SizedBox(
                          width: 150.0,
                          height: 150.0,
                          child: IconButton(
                            color: Colors.white,
                            icon: Icon(
                              FontAwesomeIcons.camera,
                              size: 30.0,
                            ),
                            onPressed: ()  async {
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Escolha uma opção',
                                        style: TextStyle(color: Colors.purple),
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            ListTile(
                                              title: Text('Galeria'),
                                              leading: Icon(
                                                Icons.photo_rounded,
                                                color: Colors.purple,
                                              ),
                                              onTap: () {
                                                chooseImage(ImageSource.gallery);
                                              },
                                            ),
                                            Divider(
                                              height: 1,
                                              color: Colors.purple,
                                            ),
                                            ListTile(
                                              title: Text('Câmera'),
                                              leading: Icon(
                                                Icons.photo_camera_rounded,
                                                color: Colors.purple,
                                              ),
                                              onTap: () {
                                                chooseImage(ImageSource.camera);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Andrew Aquino',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  Icon(
                    FontAwesomeIcons.pen,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('andrew.aquino@gmail.com',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              new Expanded(
                child: Container(),
              ),
              new Expanded(
                child: Container(),
              ),
              new Text(
                "Alterar Senha",
                softWrap: true,
                textAlign: TextAlign.center,
                style: new TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25.0, color: Colors.black87),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Nome de usuário',
                      hintStyle: TextStyle( fontSize: 18.0,color: Colors.purple),
                      labelStyle: TextStyle(color: Colors.purple)
                  )
              ),
              TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Senha',
                      hintStyle: TextStyle(fontSize: 18.0, color: Colors.purple),
                      labelStyle: TextStyle(color: Colors.purple)
                  )
              ),
              new Expanded(
                child: Container(),
              ),
              new Expanded(
                child: Container(),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.70,
                margin: EdgeInsets.all(10),
                height: 50.0,
                child: ElevatedButton(
                    child: Text("Salvar Informações",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        )),
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide(color: Colors.purple)),
                      padding: EdgeInsets.all(10.0),
                      primary: Colors.purple,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
