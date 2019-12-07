import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelsNewsList.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CircleSearchResultPage.dart';

/// 搜索条
class CirclerSearchBar extends StatefulWidget {
	CirclerSearchBar(AsyncSnapshot<CirclerModelsNewsList> snapshot, {Key key}) : super(key: key);

	_CirclerSearchBarState createState() => _CirclerSearchBarState();
}

class _CirclerSearchBarState extends State<CirclerSearchBar> with CommonNavigator {
	final formKey = GlobalKey<FormState>();

	String _searchContent;

	/// 提交搜索内容,路由跳转至子页
	void _submit() {
		final form = formKey.currentState;

		if (form.validate()) {
			form.save();
			this.navigateTo(context, CircleSearchResultPage(searchContent: this._searchContent));
		}
	}

	@override
	Widget build(BuildContext context) {
		return Form(
			key: formKey,
			child: Padding(
				padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 3.0),
				child: Row(
					children: <Widget>[
						Expanded(
							flex: 8,
							child: TextFormField(
								textAlign: TextAlign.left,
								style: TextStyle(fontSize: 12.0, color: Colors.black),
								keyboardType: TextInputType.text,
								decoration: InputDecoration(
									fillColor: Color(0xFFe4e9f5),
									filled: true,
									labelText: 'Search',
									labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
									prefixIcon: Container(
										child: Icon(Icons.search, color: Colors.black.withOpacity(0.6), size: 26.0),
									),
									border: InputBorder.none,
								),
								validator: (val) => val.isEmpty ? 'Please enter keywords.' : null,
								onSaved: (val) => this._searchContent = val,
							)
						),
						Expanded(
							child: IconButton(
								icon:Icon(Icons.airplay),
								color: Colors.black,
								iconSize: 30.0,
								onPressed: (){
									this._submit();
								}
							),
						),
				],
			),
		),
		);
	}
}