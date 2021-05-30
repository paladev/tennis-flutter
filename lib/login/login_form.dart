import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/login/bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFaliure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("./lib/images/Image.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width ,
                      height: MediaQuery.of(context).size.width ,
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Логин', border: OutlineInputBorder()),
                            controller: _usernameController,
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 30.0),
                          child:TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Пароль', border: OutlineInputBorder()),
                            controller: _passwordController,
                            obscureText: true,
                          ),),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.width * 0.20,
                            child: Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: ElevatedButton(
                                onPressed: state is! LoginLoading
                                    ? _onLoginButtonPressed
                                    : null,
                                child: Text(
                                  'Войти',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: state is LoginLoading
                                ? CircularProgressIndicator()
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
