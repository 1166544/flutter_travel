import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/redux/actions/ActionAuth.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
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
                            Container(
								width: MediaQuery.of(context).size.width,
								decoration: BoxDecoration(
									color: Colors.white
								),
								padding: EdgeInsets.fromLTRB(40.0, 10.0, 0.0, 25.0),
								child: Column(
									children: <Widget>[
										TextFormField(
											style: TextStyle(fontWeight: FontWeight.bold),
											decoration: InputDecoration(labelText: 'Username'),
											validator: (val) =>
												val.isEmpty ? 'Please enter your username.' : null,
											onSaved: (val) => _username = val,
										),
										TextFormField(
											style: TextStyle(fontWeight: FontWeight.bold,),
											keyboardType: TextInputType.visiblePassword,
											decoration: InputDecoration(labelText: 'Password'),
											validator: (val) =>
												val.isEmpty ? 'Please enter your password.' : null,
											onSaved: (val) => _password = val,
											obscureText: true,
										),
									],
								),
							),
							Container(
								padding: EdgeInsets.fromLTRB(40.0, 25.0, 40.0, 40.0),
								child: GestureDetector(
									onTap: () {
										this._submit();
                                        loginAction(context, _username, _password);
									},
									child: Container(
										decoration: BoxDecoration(
											color: Color(0xFF5e82f5),
											borderRadius: BorderRadius.circular(9.0)
										),
										padding: EdgeInsets.all(10.0),
										child: Center(
											child: Text(
												'Login',
												style: TextStyle(
													fontSize: 19.0,
													fontWeight: FontWeight.bold,
													color: Colors.white
												)
											),
										),
									)
								)
							)
                        ],
                    ),
                );
            }
        );
    }
}