import 'package:flutter/material.dart';
import 'package:flutter_scopedmodel_login/home.dart';
import 'package:flutter_scopedmodel_login/model/Sessao.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Tela de login'),
    routes: {
      HomePage.routeName: (context) => HomePage()
    }
    );
  }
}

class LoginPage extends StatefulWidget {

  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    _controllerLogin.text="email@gmail.com.br";
    _controllerSenha.text="12345";

    void _validar() {

      if (_formKey.currentState.validate()) {

        if ( (_controllerLogin.text=="email@gmail.com")&&(_controllerSenha.text=="12345") ){

          //
          // QUERO POPULAR UM OBJETO SESSAO COM UM NOME XPTO PARA EXIBIR NA TELA SEGUINTE
          //
          // ATE RESOLVI DE UM JEITO "POUCO ELEGANTE" TRAFEGANDO O OBJETO VIA PARAMETRO,
          // MAS QUERIA SABER COMO FAZ USANDO O SCOPEDMODEL
          //

          Navigator.pushNamed(context, HomePage.routeName);

        }else{

          showDialog(
              context: context,
              builder: (BuildContext context) {
                // retorna um objeto do tipo Dialog
                return AlertDialog(
                  title: new Text("Ops!"),
                  content: new Text(
                      "E-mail deve ser email@gmail.com e a senha 12345!"),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });

        }

      }

    }

    return ScopedModel<Sessao>(
        model: new Sessao(),
        child: Scaffold(
                          appBar: AppBar(
                                          title: Text(widget.title),
                                  ),
                          resizeToAvoidBottomPadding: true,
                          body: Padding(
                                    padding: EdgeInsets.all(30),
                                    child: Form(
                                            key: _formKey,
                                            child:Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: <Widget>[
                                                            TextFormField(
                                                                keyboardType: TextInputType.emailAddress,
                                                                controller: _controllerLogin,
                                                                decoration: new InputDecoration(
                                                                  labelText: "E-mail",
                                                                ),
                                                                autocorrect: false,
                                                                maxLength: 100,
                                                                validator: (value) {
                                                                  if (value.isEmpty) {
                                                                    return 'Informe seu e-mail de acesso!';
                                                                  }
                                                                  return null;
                                                                }),
                                                            TextFormField(
                                                                keyboardType: TextInputType.number,
                                                                controller: _controllerSenha,
                                                                decoration: new InputDecoration(
                                                                  labelText: "Senha",
                                                                ),
                                                                obscureText: true,
                                                                maxLength: 8,
                                                                validator: (value) {
                                                                  if (value.isEmpty) {
                                                                    return 'Informe sua senha!';
                                                                  }
                                                                  return null;
                                                                }),
                                                          ],
                                                  )
                                        ),
                                  ),
                          floatingActionButton: FloatingActionButton(
                                                  onPressed: _validar,
                                                  child: Icon(Icons.check),
                                                ),
        )
    );

  }

}


