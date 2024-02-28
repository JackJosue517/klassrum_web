import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klassrum_web/logic/blocs/auth/auth_bloc.dart';
import 'package:klassrum_web/ui/configs/styles.dart';
import 'package:line_icons/line_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  String? _isValid(value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer la valeur requise';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Connectez-vous à votre compte Klassrum'),
          centerTitle: true,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error,),),);
            }
          },
          builder: (context, state) {
            if(state is AuthLoading){
              return const Center(child: CircularProgressIndicator(),);
            }

            return Center(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: _isValid,
                        autofocus: true,
                        controller: _usernameTextController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(LineIcons.userAlt),
                          hintText: "Entrer votre nom d'utilisateur",
                          labelText: "Nom d'utilisateur",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: _passwordTextController,
                        validator: _isValid,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(LineIcons.key),
                            suffixIcon: Icon(LineIcons.eyeSlashAlt),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "Entrer votre mot de passe",
                            labelText: "Mot de passe"),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.trueWhiteColor,
                            elevation: 0,
                          ),
                          onPressed: ()  {
                            if (_formKey.currentState!.validate()) {
                              final username = _usernameTextController.text;
                              final password = _passwordTextController.text;
                              context.read<AuthBloc>().add(AuthLoginRequested(username: username, password: password));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text('Se connecter', style: AppText.headline4),
                          ),
                        ),
                      )
                    ],
                  )),
            ));
          },
        ));
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
}
