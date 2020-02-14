import 'package:flutter/material.dart';
import 'package:flutter_scopedmodel_login/edit.dart';
import 'package:flutter_scopedmodel_login/model/Sessao.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Home',
      home: HomePage(title: 'Tela Home'),
    );

  }
}

class HomePage extends StatefulWidget {

  static const routeName = '/homeScreen';

  final String title = "Home do aplicativo";

  HomePage({Key key, title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return ScopedModel<Sessao>(
        model: new Sessao(),
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(30),
            child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text( 'Esta é a Home!', style: TextStyle(fontSize: 30),),
                      Padding(
                          padding: EdgeInsets.all(30),
                          child:Text( 'Aqui eu quero mostrar o email informado na tela de login, usando um objeto Sessao populado na origem da chamada!', textAlign: TextAlign.justify)
                      ),
                      Padding(
                          padding: EdgeInsets.all(30),
                          child:Text( 'Detalhe: depois, pressionando o FAB, vou para uma tela onde vou editar o nome do usuario, alterar o referido atributo na sessao, refletindo a mudança em todos os Widgets do aplicativo.', textAlign: TextAlign.justify,)
                      ),
                    ],
                  )
        ),
      ),
      floatingActionButton: _renderizaFABs(),
    )
    );
  }

  Widget _renderizaFABs(){

    return
      Row( children:
      [
        Padding(
            padding: EdgeInsets.only(left: 30),
            child:
            FloatingActionButton(
                heroTag: "ht1", // NAO SEI PORQUE PRECISA DISSO. SEM, NAO FUNCIONOU.
                child: Icon(Icons.exit_to_app),
                onPressed: () => {
                  Navigator.of(context).pop()
                }
            )
        ),
        Spacer(),
        FloatingActionButton(
                heroTag: "ht2",
                child: Icon(Icons.mode_edit),
                onPressed: () => {
                                    Navigator.pushNamed(context, EditPage.routeName)
                }
            ),

      ]
      );

  }

}
