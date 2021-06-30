import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legendary_app/model/TagLista.dart';
import 'package:legendary_app/res/RouteGenerator.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UploadImagePage extends StatefulWidget {
  // const UploadImagePage({Key? key, required User user})
  //     : _user = user,
  //       super(key: key);
  //
  // final User _user;

  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  late File imageFile;
  final picker = ImagePicker();
  bool isImagePicked = false;

  final TextEditingController _controller = new TextEditingController();

  List<String> tags = ["superman", "sweetheart"];
  List<String> itensMenu = ["Perfil", "Favoritos", "Sair"];

  void _showMessage(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _actionsPopupMenu(BuildContext context, String item) {
    if (item == "Perfil") {
      Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_EDITARPERFIL);
    } else if (item == "Favoritos") {
      Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_FAVORITOS);
    } else {
      Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_HOME);
    }
  }

  Future chooseImage(BuildContext context, ImageSource source) async {
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

    String fileName = imageFile.path;
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('photos/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
        );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Legendary',
          style: TextStyle(
            //fontFamily: 'RobotoMono',
            color: Color(0xffBA68C8),
            fontSize: 35,
          ),
        ),
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: <Widget>[
          PopupMenuButton<String>(
            padding: EdgeInsets.fromLTRB(10, 10, 27, 10),
            icon: Icon(
              Icons.menu,
              color: Color(0xffBA68C8),
              size: 40,
            ),
            onSelected: (String item) {
              _actionsPopupMenu(context, item);
            },
            itemBuilder: (context) {
              return itensMenu.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(color: Color(0xffBA68C8)),
                  ),
                );
              }).toList();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 50),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xffce93d8),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () async {
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
                                              chooseImage(
                                                  context, ImageSource.gallery);
                                              Navigator.of(context).pop();
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
                                              chooseImage(
                                                  context, ImageSource.camera);
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: isImagePicked != true
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    color: Colors.grey[400],
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.add_a_photo,
                                            color: Colors.grey[100],
                                            size: 50.0),
                                        Text(
                                          'Adicionar',
                                          style: TextStyle(
                                              color: Colors.grey[100]),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: FileImage(imageFile),
                                      ),
                                    ),
                                  ))),
                      Container(
                        width: MediaQuery.of(context).size.width * 1.1,
                        margin: EdgeInsets.fromLTRB(18, 18, 18, 5),
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Color(0xffDEA1E9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          controller: _controller,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value) {
                            if (tags.contains(value)) {
                              _showMessage(context,
                                  'Essa tag já foi adicionada anteriormente');
                            } else {
                              tags.add(value);
                            }
                            _controller.clear();
                          },
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.add, color: Color(0xffFFFFFF)),
                            hintText: 'adicionar filtro',
                            hintStyle: TextStyle(
                              color: Color(0xffF6F2F2),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 18, 18, 12),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            children: tags.map((tag) {
                              return Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Chip(
                                  deleteIcon: Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  ),
                                  onDeleted: () {
                                    setState(() {
                                      tags.removeWhere(
                                          (element) => element == tag);
                                    });
                                  },
                                  label: Text(
                                    tag,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Color(0xffEBBAF3),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.265,
              left: MediaQuery.of(context).size.width / 2.35,
              child: GestureDetector(
                onTap: () {
                  uploadImageToServer(imageFile);
                  Navigator.pushNamed(context, RouteGenerator.ROTA_LEGENDAS,
                      arguments: TagLista(tags));
                },
                child: ClipOval(
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Color(0xffBA68C8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_forward_ios, color: Color(0xffFFFFFF)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  uploadImageToServer(File imageFile) async {

    var stream = http.ByteStream(imageFile.openRead());
    stream.cast();

    var length = await imageFile.length();

    var uri = Uri.parse('http://8a5f41d0e19d.ngrok.io/image');

    var request = http.MultipartRequest("POST", uri);
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));

    request.files.add(multipartFile);
    var response = await request.send();

    setState(() {
      response.stream.transform(utf8.decoder).listen((value) {
        tags.add(value);
      });
    });

  }
}
