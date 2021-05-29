import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImagePage extends StatefulWidget {
  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  final TextEditingController _controller = new TextEditingController();

  List<String> tags = ["Perfil", "Favoritos", "Sair"];
  List<String> itensMenu = ["Perfil", "Favoritos", "Sair"];

  void _showMessage(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _actionsPopupMenu(String item) {
    print("TESTE");
  }

  void _chooseGaleryImage() async {
    File _image;
    final _picker = ImagePicker();

    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('A imagem não foi selecionada');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            'Legendery',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              color: Color(0xffBA68C8),
              fontSize: 35,
            ),
          ),
          backgroundColor: Color(0xffFFFFFF),
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
              onSelected: _actionsPopupMenu,
              itemBuilder: (context) {
                return itensMenu.map((String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList();
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Color(0xffce93d8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _chooseGaleryImage();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          color: Colors.grey[400],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.add_a_photo,
                                  color: Colors.grey[100], size: 50.0),
                              Text(
                                'Adicionar',
                                style: TextStyle(color: Colors.grey[100]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
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
                                  tags.removeWhere((element) => element == tag);
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
                  ],
                ),
              ),
            ),
            Positioned(
              top: 535,
              left: 180,
              child: GestureDetector(
                onTap: () {
                  _chooseGaleryImage();
                },
                child: ClipOval(
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Color(0xffBA68C8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_forward_ios,
                            color: Color(0xffFFFFFF), size: 50.0),
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
}
