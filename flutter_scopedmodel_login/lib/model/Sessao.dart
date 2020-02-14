import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class Sessao extends Model {

  String token;
  String email;
  String nome;

  Sessao();

  @override
  String toString() {
    return 'Sessao{token: $token, email: $email, nome: $nome}';
  }

  static Sessao of(BuildContext context) => ScopedModel.of<Sessao>(context);

}