import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legendary_app/res/RouteGenerator.dart';
import 'dart:io';
import 'package:legendary_app/utils/authentication.dart';
import 'package:legendary_app/utils/validator.dart';
import 'package:legendary_app/widgets/custom_form_field.dart';

class EditarPerfilPageView extends StatefulWidget {
  const EditarPerfilPageView({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _EditarPerfilPageViewState createState() => _EditarPerfilPageViewState();
}

class _EditarPerfilPageViewState extends State<EditarPerfilPageView> {
  final FocusNode _displayNameFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _editFormKey = GlobalKey<FormState>();

  late User _user;
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
        _uploadImagem(imageFile);
      }
    });
  }

  void updateUserInfo(String url) {
    _user
        .updateProfile(displayName: _user.displayName, photoURL: url)
        .then((value) {
    }).catchError((e) {
      print("There was an error updating profile");
    });
  }

  Future _uploadImagem(File imageFile) async {
    //Referenciar arquivo
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz.child("fotos").child("foto1.jpg");

    //Fazer upload da imagem
    UploadTask task = arquivo.putFile(imageFile);

    //Controlar progresso do upload
    task.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      if (taskSnapshot.state == TaskState.success) {
        _recuperarUrlImagem(taskSnapshot);
      }
    });
  }

 Future _recuperarUrlImagem(TaskSnapshot taskSnapshot) async {
    String url = await taskSnapshot.ref.getDownloadURL();
    print("resultado url: " + url);

    setState(() {
      updateUserInfo(url);
    });
  }



  void initState() {
    _user = widget._user;
    _displayNameController.text = _user.displayName!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, RouteGenerator.ROTA_CADASTRARIMAGEM);
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
                    child: GestureDetector(
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
                                            chooseImage(ImageSource.gallery);
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
                                            chooseImage(ImageSource.camera);
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: _user.photoURL == null
                            ? CircleAvatar(
                                radius: 90,
                                backgroundColor: Colors.grey.shade400,
                                child: Icon(
                                  Icons.photo_camera_rounded,
                                  color: Colors.grey.shade600,
                                  size: 42.0,
                                ),
                              )
                            : CircleAvatar(
                                radius: 90,
                                backgroundImage: NetworkImage(_user.photoURL!),
                              )),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_displayNameController.text,
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.pen,
                        size: 15.0,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Widget cancelaButton = FlatButton(
                          child: Text("Cancelar"),
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                        );
                        Widget salvarButton = FlatButton(
                          child: Text("Salvar"),
                          onPressed: () {
                            if (_editFormKey.currentState!.validate()) {
                              setState(() async {
                                _displayNameController.text;
                                Navigator.pop(context, false);
                              });
                            }
                          },
                        );
                        // configura o  AlertDialog
                        AlertDialog alerta = AlertDialog(
                          title: Text("Alterar Nome de Usuário"),
                          content: Form(
                              key: _editFormKey,
                              child: CustomFormField(
                                controller: _displayNameController,
                                focusNode: _displayNameFocusNode,
                                keyboardType: TextInputType.name,
                                inputAction: TextInputAction.next,
                                isCapitalized: true,
                                validator: (value) => Validator.validateName(
                                  name: value,
                                ),
                                hint: '',
                              )),
                          actions: [
                            cancelaButton,
                            salvarButton,
                          ],
                        );
                        // exibe o dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alerta;
                          },
                        );
                      }),
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
                            child: Text(_user.email!,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 15.0)),
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
              FlatButton(
                child: Text(
                  "Alterar senha?",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black54),
                ),
                onPressed: () {
                  Widget cancelaButton = FlatButton(
                    child: Text("Cancelar"),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  );
                  Widget salvarButton = FlatButton(
                    child: Text("Salvar"),
                    onPressed: () {
                      setState(() async {
                        if (_editFormKey.currentState!.validate()) {
                          _passwordController.text;
                          Navigator.pop(context, false);
                        }
                      });
                    },
                  );
                  // configura o  AlertDialog
                  AlertDialog alerta = AlertDialog(
                    title: Text("Alterar Senha"),
                    content: Form(
                        key: _editFormKey,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              CustomFormField(
                                controller: _nameController,
                                focusNode: _nameFocusNode,
                                keyboardType: TextInputType.name,
                                inputAction: TextInputAction.next,
                                isCapitalized: true,
                                validator: (value) => Validator.validateName(
                                  name: value,
                                ),
                                hint: 'Nome de usuário',
                              ),
                              CustomFormField(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                keyboardType: TextInputType.text,
                                inputAction: TextInputAction.done,
                                validator: (value) =>
                                    Validator.validatePassword(
                                  password: value,
                                ),
                                isObscure: true,
                                hint: 'Senha',
                              ),
                            ])),
                    actions: [
                      cancelaButton,
                      salvarButton,
                    ],
                  );
                  // exibe o dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alerta;
                    },
                  );
                },
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
                      setState(() async {
                        if (_displayNameController.text.isNotEmpty &&
                            _displayNameController.text != _user.displayName) {
                          _user.updateDisplayName(_displayNameController.text);
                        }
                        if (_passwordController.text.isNotEmpty) {
                          _user = (await Authentication.changePassword(
                              _passwordController.text))!;
                        }

                        _user = (await Authentication.refreshUser(_user))!;
                        Navigator.pushNamed(
                            context, RouteGenerator.ROTA_CADASTRARIMAGEM);
                      });
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
