import 'package:flutter/material.dart';
import 'package:flutter_scopedmodel_login/home.dart';
import 'package:flutter_scopedmodel_login/model/Sessao.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(EditApp());

class EditApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alterar nome',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EditPage(title: 'Alterar nome'),
    routes: {
      HomePage.routeName: (context) => HomePage()
    }
    );
  }
}

class EditPage extends StatefulWidget {

  static const routeName = '/editScreen';

  final String title = "Edição";

  EditPage({Key key, title}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();

}

class _EditPageState extends State<EditPage> {

  TextEditingController _controllerNome = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    _controllerNome.text="deve vir da sessao mas nao sei como";

    void _validar() {

      if (_formKey.currentState.validate()) {

          //
          // QUERO ALTERAR O ATRIBUTO NOME DA SESSAO E REFLETIR ISSO POR TODOS WIDGETS DO APP
          //

          Navigator.pushNamed(context, HomePage.routeName);

      }

    }

    return Scaffold(
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
                                                                keyboardType: TextInputType.text,
                                                                controller: _controllerNome,
                                                                decoration: new InputDecoration(
                                                                  labelText: "Nome do usuário",
                                                                ),
                                                                maxLength: 50,
                                                                validator: (value) {
                                                                  if (value.isEmpty) {
                                                                    return 'Informe o nome do usuário!';
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
    );

  }

}


