import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/profile/models/ModelProfile.dart';
import 'package:flutter_travel/modules/profile/views/pages/PageFormSubmit.dart';

/// 顶部头像结构
class ComponentTopStructs extends StatefulWidget {
  ComponentTopStructs({Key key, AsyncSnapshot<ModelProfile> snapshot}) : super(key: key);

  _ComponentTopStructsState createState() => _ComponentTopStructsState();
}

class _ComponentTopStructsState extends State<ComponentTopStructs> with CommonNavigator {
	@override
	Widget build(BuildContext context) {
		return Container(
			decoration: BoxDecoration(
				color: Color(0xFF45489e),
				borderRadius: BorderRadius.only(
					topLeft: Radius.circular(0.0), 
					topRight: Radius.circular(0.0), 
					bottomLeft: Radius.circular(20.0), 
					bottomRight: Radius.circular(20.0),
				)
			),
			padding: EdgeInsets.fromLTRB(35.0, 25.0, 15.0, 20.0),
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
					Icon(Icons.edit, color: Colors.white),
					SizedBox(width: 5.0),
					Text('EDIT', style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.6)),)
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
		return Column(
			mainAxisAlignment: MainAxisAlignment.start,
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				SizedBox(height: 45.0),
				Hero(
					tag: 'assets/images/chatbubble.png',
					child: Container(
						height: 85.0,
						width: 85.0,
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(62.5),
							image: DecorationImage(
								fit:BoxFit.cover,
								image: AssetImage('assets/images/chatbubble.png')
							),
							boxShadow: [
								BoxShadow(
									color: Color(0xff302f90),
									offset: Offset(10.0, 8.0),
									blurRadius: 10.5,
									spreadRadius: 8.8)
							] 
						),
					),
				),
				SizedBox(height: 15.0),
				Text(
					'Mark Stewart',
					style: TextStyle(
						fontSize: 18.0,
						color: Colors.white,
						fontWeight: FontWeight.bold
					)
				),
				SizedBox(height: 10.0),
				Text(
					'20mg capsule',
					style: TextStyle(
						fontSize: 12.0,
						color: Color(0xFF8b8cda)
					)
				),
			],
		);
	}
}