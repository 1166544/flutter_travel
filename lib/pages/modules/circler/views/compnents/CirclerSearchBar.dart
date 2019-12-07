import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelsNewsList.dart';

/// 搜索条
class CirclerSearchBar extends StatefulWidget {
	final callBack;
	final String content;
	CirclerSearchBar({Key key, AsyncSnapshot<CirclerModelsNewsList> snapshot, this.callBack, this.content}) : super(key: key);

	_CirclerSearchBarState createState() => _CirclerSearchBarState(callBack: this.callBack, content: this.content);
}

class _CirclerSearchBarState extends State<CirclerSearchBar> with CommonNavigator {
	final formKey = GlobalKey<FormState>();

	String searchContent;
	String content;

	dynamic callBack;

	_CirclerSearchBarState({ dynamic callBack, String content}): super() {
		this.callBack = callBack;
		this.content = content;
	}

	/// 提交搜索内容,路由跳转至子页
	void submit() {
		final form = formKey.currentState;

		if (form.validate()) {
			form.save();
			if (widget.callBack != null) {
				widget.callBack(this.searchContent);
			}
		}
	}

	@override
	Widget build(BuildContext context) {
		return this.getSearchBarForm(title: this.content);
	}

	/// 返回搜索条结构
	Widget getSearchBarForm({String title}) {
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
									controller: TextEditingController.fromValue(
										TextEditingValue(text: '${title == null ? "" : title}')
									),
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
									onSaved: (val) => this.searchContent = val,
								)
							),
							Expanded(
								child: IconButton(
									icon:Icon(Icons.airplay),
									color: Colors.black,
									iconSize: 30.0,
									onPressed: (){
										this.submit();
									}
								),
							),
					],
				),
			),
		);
	}
}