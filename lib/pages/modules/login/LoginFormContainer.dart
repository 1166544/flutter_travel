import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/presentation/PresentationPlatformAdaptiveButton.dart';
import 'package:flutter_travel/models/ModelAppState.dart';
import 'package:flutter_travel/redux/actions/ActionAuth.dart';
import 'package:redux/redux.dart';

class LoginForm extends StatefulWidget {
    @override
    _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
    final formKey = GlobalKey<FormState>();

    String _username;
    String _password;

    void _submit() {
        final form = formKey.currentState;

        if (form.validate()) {
            form.save();
        }
    }

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, dynamic>(
            converter: (Store<AppState> store) {
                return (BuildContext context, String username, String password) => 
                    store.dispatch(login(context, username, password));
            },
            builder: (BuildContext context, loginAction) {
                return Form(
                    key: formKey,
                    child: Column(
                        children: [
                            TextFormField(
                                decoration: InputDecoration(labelText: 'Username'),
                                validator: (val) =>
                                    val.isEmpty ? 'Please enter your username.' : null,
                                onSaved: (val) => _username = val,
                            ),
                            TextFormField(
                                decoration: InputDecoration(labelText: 'Password'),
                                validator: (val) =>
                                    val.isEmpty ? 'Please enter your password.' : null,
                                onSaved: (val) => _password = val,
                                obscureText: true,
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: PlatformAdaptiveButton(
                                    onPressed:() {
                                        _submit();
                                        loginAction(context, _username, _password);
                                    },
                                    icon: Icon(Icons.done),
                                    child: Text('Log In'),
                                ),
                            )
                        ],
                    ),
                );
            }
        );
    }

}