import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legendary_app/res/RouteGenerator.dart';
import 'package:legendary_app/utils/authentication.dart';
import 'package:legendary_app/utils/validator.dart';
import 'package:legendary_app/view/Home.dart';
import 'package:legendary_app/widgets/custom_form_field.dart';

class CadastrarPageView extends StatefulWidget {
  @override
  _CadastrarPageViewState createState() => _CadastrarPageViewState();
}

class _CadastrarPageViewState extends State<CadastrarPageView> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();

  final auth = FirebaseAuth.instance;
  bool _isSingningUp = false;

  @override
  Widget build(BuildContext context) {
    return  Form(
            key: _registerFormKey,
            child: Scaffold(
              backgroundColor: Colors.grey,
              body: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("images/dogs.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    _nameFocusNode.unfocus();
                    _emailFocusNode.unfocus();
                    _passwordFocusNode.unfocus();

                    setState(() {
                      _isSingningUp = true;
                    });

                    if (_registerFormKey.currentState!.validate()) {
                      User? user =
                          await Authentication.registerUsingEmailPassword(
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context,
                      );

                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePageView()));
                      }
                    }

                    setState(() {
                      _isSingningUp = false;
                    });
                  },
                  child: Icon(Icons.arrow_forward_ios_rounded),
                  backgroundColor: Colors.purple),
              bottomNavigationBar: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                width: double.infinity,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                child: Container(
                  // margin: EdgeInsets.all(4.0),
                  alignment: Alignment.bottomCenter,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Cadastrar",
                          softWrap: true,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.black87),
                        ),
                        new Expanded(
                          child: Container(),
                        ),
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
                        SizedBox(height: 16.0),
                        CustomFormField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          validator: (value) => Validator.validateEmail(
                            email: value,
                          ),
                          hint: 'E-mail',
                        ),
                        SizedBox(height: 16.0),
                        CustomFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          keyboardType: TextInputType.text,
                          inputAction: TextInputAction.done,
                          validator: (value) => Validator.validatePassword(
                            password: value,
                          ),
                          isObscure: true,
                          hint: 'Senha',
                        ),
                        new Expanded(
                          child: Container(),
                        ),
                        InkWell(
                          child: new Text(
                            '< Voltar',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteGenerator.ROTA_HOME);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
            ));
  }
}
