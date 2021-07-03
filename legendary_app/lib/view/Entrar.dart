import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:legendary_app/res/RouteGenerator.dart';
import 'package:legendary_app/utils/authentication.dart';
import 'package:legendary_app/utils/validator.dart';
import 'package:legendary_app/widgets/custom_form_field.dart';
import 'CarregarImagem.dart';

class EntrarPageView extends StatefulWidget {
  @override
  _EntrarPageViewState createState() => _EntrarPageViewState();
}

class _EntrarPageViewState extends State<EntrarPageView> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final auth = FirebaseAuth.instance;
  bool _isSigningIn = false;

  final _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _signInFormKey,
        child: Scaffold(
          backgroundColor: Color(0xffc3b383),
          body: new Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("images/ballons.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.height * 0.30,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      'Bem-vindo(a) de volta!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () async {

                _emailFocusNode.unfocus();
                _passwordFocusNode.unfocus();

                setState(() {
                  _isSigningIn = true;
                });

                if (_signInFormKey.currentState!.validate()) {
                  User? user = await Authentication.signInUsingEmailPassword(
                    context: context,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => UploadImagePage(
                              user: auth.currentUser,
                            )));
                  }
                }

                setState(() {
                  _isSigningIn = false;
                });
              },
              child: Icon(Icons.arrow_forward_ios_rounded),
              backgroundColor: Colors.purple),
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            ),
            child: Container(
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
                      "Entrar",
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
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateEmail(
                        email: value,
                      ),
                      hint: 'Enter your email',
                    ),
                    CustomFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => null,
                      isObscure: true,
                      hint: 'Senha',
                    ),
                    new Expanded(
                      child: Container(),
                    ),
                    Container(
                      height: 50.0,
                      child: SignInButton(
                        Buttons.Google,
                        text: "Continuar com o Google",
                        onPressed: () async {
                          setState(() {
                            _isSigningIn = true;
                          });
                          User? user = await Authentication.signInWithGoogle(
                              context: context);

                          setState(() {
                            _isSigningIn = false;
                          });

                          if (user != null) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    UploadImagePage(user: user),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    new Expanded(
                      child: Container(),
                    ),
                    InkWell(
                      child: new Text(
                        'Cadastre-se',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                      onTap: () {
                        Navigator.popAndPushNamed(
                            context, RouteGenerator.ROTA_CADASTRO);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        ));
  }
}
