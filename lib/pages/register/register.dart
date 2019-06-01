import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_up/model/model_user.dart';
import 'package:flutter_up/pages/login/login.dart';
import 'package:mask_shifter/mask_shifter.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _dataAtual =  DateTime.now().toString();
  FirebaseStorage storage = FirebaseStorage.instance;
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmarEmailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _cpfcnpjController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _descricaoController = TextEditingController();
  String _foto;
  bool _progressIndicator = false;
  bool _alterarFoto = true;
  bool _userEdited = false;
  bool _fotoIsLoading = false;
  String _nome,
      _email,
      _confirmarEmail,
      _senha,
      _confirmarSenha,
      _telefone,
      _cpfcnpj,
      _endereco,
      _descricao;

  final _formKey = GlobalKey<FormState>();

  void onChange() {
    _userEdited = true;
  }

  @override
  void initState() {
    _nomeController.addListener(onChange);
    _emailController.addListener(onChange);
    _cpfcnpjController.addListener(onChange);
    _enderecoController.addListener(onChange);
    _descricaoController.addListener(onChange);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cadastro da Barbearia",
            style: TextStyle(fontSize: 16.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 90.0),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Digite o nome da barbearia.';
                        }
                      },
                      onSaved: (input) => _nome = input,
                      decoration: InputDecoration(
                          labelText: "Nome",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _nomeController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 30,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Digite o email da barbearia.';
                        }
                      },
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _emailController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 60,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Confirme o email da barbearia.';
                        } else if (input != _emailController.text) {
                          return 'Os emails não combinam.';
                        }
                      },
                      onSaved: (input) => _confirmarEmail = input,
                      decoration: InputDecoration(
                          labelText: "Confirmar o Email",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _confirmarEmailController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 60,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Digite a senha da barbearia.';
                        } else if (input.length < 6) {
                          return 'A senha deve ter mais de 6 caracteres.';
                        }
                      },
                      onSaved: (input) => _senha = input,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _senhaController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 20,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Confirme a senha da barbearia.';
                        } else if (input != _senhaController.text) {
                          return 'As senhas não combinam.';
                        }
                      },
                      onSaved: (input) => _confirmarSenha = input,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Confirmar a Senha",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _confirmarSenhaController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 20,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Digite o telefone/celular da barbearia.';
                        }
                      },
                      onSaved: (input) => _telefone = input,
                      inputFormatters: [
                        MaskedTextInputFormatterShifter(
                          maskONE: "(XX)XXXX-XXXX",
                          maskTWO: "(XX)XXXXX-XXXX",),
                      ],
                      decoration: InputDecoration(
                          labelText: "Telefone/Celular",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _telefoneController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 20,
                    ),
                  ],
                ),
                _progressIndicator == false
                    ? Container(
                  width: 200,
                  height: 60, //Mesma altura do end do Tween
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      signUp();
                    },
                    child: Text(
                      "Cadastrar",
                      textAlign: TextAlign.start,
                      style:
                      TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                )
                    : const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 100),
                  child: Center(
                      child: CircularProgressIndicator(
                          valueColor:  AlwaysStoppedAnimation<Color>(
                              Colors.black))),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> signUp() async {
    final _formState = _formKey.currentState;

    if (_formState.validate()) {
      _formState.save();
      try {
        setState(() {
          _progressIndicator = true;
        });
/*        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _email.trimRight().trimLeft(),
            password: _senha);*/

/*        Firestore.instance.collection("Barbearias").document(user.uid).setData({
          "Nome":
          transformaPrimeiraLetraEmMaiusculo(_nome.trimRight().trimLeft()),
          "Longitude": "",
          "Latitude": "",
          "Criado_em":  DateTime.now(),
          "Foto": _foto,
          "Endereco": _endereco,
          "Email": _email.trimRight().trimLeft(),
          "Telefone": _telefone,
          "CpfCnpj": _cpfcnpj,
          "Descricao": _descricao,
        });*/
      } catch (e) {
        setState(() {
          _progressIndicator = false;
        });
        print(e);
      } finally {
        ModelUser.instance.signIn(
          email: _email.trimRight().trimLeft(),
          pass: _senha,
          onSuccess: () {
/*            Navigator.of(context).pushReplacement<dynamic, dynamic>(
                MaterialPageRoute<dynamic>(builder: (context) => Home()));*/
          },
          onFail: () {
            Navigator.of(context).pushReplacement<dynamic, dynamic>(
                MaterialPageRoute<dynamic>(builder: (context) => Login()));
          },
        );
      }
    }
  }

  String transformaPrimeiraLetraEmMaiusculo(String nome) {
    String primeiraLetra = nome.substring(0, 1).toUpperCase();
    return primeiraLetra + nome.substring(1, nome.length);
  }
}