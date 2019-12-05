import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/redux/actions/ActionAuth.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/styles/StyleColors.dart';

class MainDrawer extends StatelessWidget {
    
    MainDrawer({Key key}): super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, dynamic>(
            converter: (store) => (BuildContext context) { store.dispatch(logout(context)); },
            builder: (BuildContext context, logout) => Drawer(
                child: ListView(
                    children: <Widget>[
                    Container(
                        height: 120.0,
                        child: DrawerHeader(
                        padding: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFECEFF1),
                        ),
                        child: Center(
                            child: FlutterLogo(
                            colors: colorStyles['primary'],
                            size: 54.0,
                            ),
                        ),
                        ),
                    ),
                    ListTile(
                        leading: Icon(Icons.chat),
                        title: Text('Support'),
                        onTap: () => print('you pressed support')
                    ),
                    ListTile(
                        leading: Icon(Icons.info),
                        title: Text('About'),
                        onTap: () => print('you pressed about')
                    ),
                    Divider(),
                    ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Sign Out'),
                        onTap: () => logout(context)
                    ),
                    ],
                )
            )
        );
    }

}