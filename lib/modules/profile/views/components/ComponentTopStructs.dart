import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/profile/models/ModelProfile.dart';
import 'package:flutter_travel/modules/profile/views/pages/PageFormSubmit.dart';
import 'package:flutter_travel/redux/states/StateAuth.dart';

/// 顶部头像结构
class ComponentTopStructs extends StatefulWidget {
	final StateAuth auth;
	final AsyncSnapshot<ModelProfile> snapshot;
  	ComponentTopStructs({Key key, this.snapshot, this.auth}) : super(key: key);

  	_ComponentTopStructsState createState() => _ComponentTopStructsState();
}

class _ComponentTopStructsState extends State<ComponentTopStructs> with CommonNavigator {
	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.fromLTRB(20.0, 25.0, 15.0, 20.0),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					this.getAvataItem(),
					Spacer(),
					this.getEditItem()
				],
			),
		);
	}

	/// 编辑个人信息
	Widget getEditItem() {
		return GestureDetector(
			child: Row(
				mainAxisAlignment: MainAxisAlignment.end,
				crossAxisAlignment: CrossAxisAlignment.end,
				children: <Widget>[
					Icon(Icons.edit, color: Colors.black, size: 15.0),
					SizedBox(width: 5.0),
					Text('EDIT', style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.6)),)
				],
			),
			onTap: this.navigateToProfile,
		);
	}

	/// 跳转至编辑页
	void navigateToProfile() { 
		this.navigateTo(context, PageFormSubmit());
	}

	/// 头像信息
	Widget getAvataItem() {
		return Row(
			mainAxisAlignment: MainAxisAlignment.start,
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Hero(
					tag: widget.auth.user.user.avatarUrl,
					child: Container(
						height: 55.0,
						width: 55.0,
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(7),
							image: DecorationImage(
								fit:BoxFit.cover,
								image: CommentImageNetwork.imageNetwork(widget.auth.user.user.avatarUrl)
							),
							boxShadow: [
								BoxShadow(
									color: Colors.grey,
									offset: Offset(1.0, 1.0),
									blurRadius: 1,
									spreadRadius: 1)
							] 
						),
					),
				),
				SizedBox(width: 15.0),
				Column(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Text(
							widget.auth.user.user.name,
							style: TextStyle(
								fontSize: 22.0,
								color: Colors.black,
								fontWeight: FontWeight.bold
							)
						),
						SizedBox(height: 10.0),
						Text(
							widget.auth.user.user.bio,
							style: TextStyle(
								fontSize: 12.0,
								color: Colors.black
							)
						)
					]
				),
			],
		);
	}
}