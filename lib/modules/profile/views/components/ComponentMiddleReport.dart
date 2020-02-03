import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/profile/models/ModelProfile.dart';
import 'package:flutter_travel/modules/profile/views/components/ComponentProfileComment.dart';
import 'package:flutter_travel/redux/states/StateAuth.dart';

/// 中部报告信息
class ComponentMiddleReport extends StatefulWidget {
	final StateAuth auth;
	final AsyncSnapshot<ModelProfile> snapshot;
  	ComponentMiddleReport({Key key, this.snapshot, this.auth}) : super(key: key);

  	_ComponentMiddleReportState createState() => _ComponentMiddleReportState();
}

class _ComponentMiddleReportState extends State<ComponentMiddleReport> with ComponentProfileComment {
	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[

					// 趋势分析面板
					this.getTrendsItem(),
					
					SizedBox(height: 33.0),
					
					// 趋势分析块
					this.getTrendsBlock(),
					
					SizedBox(height: 50.0),
					
					// 带黄底横线标题
					this.getUnderlineText('Reported Ava'),
					
					SizedBox(height: 15.0),
					
					Text(
						'[Personal tech blog] ${widget.auth.user.user.htmlUrl}',
						style: TextStyle(
							fontSize: 14.0,
							color: Color(0xFF252949)
						)
					),
					
					SizedBox(height: 30.0),
					
					// 绿色进度条文本
					Text(
						'Follower / Following',
						style: TextStyle(
							fontSize: 12.0,
							color: Colors.grey
						)
					),
					
					SizedBox(height: 10.0),
					
					// 进度条顶部
					this.getStackItem()
				],
			),
		);
	}

	/// 趋势分析面板
	Widget getTrendsItem() {
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: [
				this.getTrendsIcon(Icons.play_for_work, Colors.black, 'Repos', descNum: widget.auth.user.user.publicReposCount),
				this.getTrendsIcon(Icons.explore, Colors.black.withOpacity(0.3), 'Gists', descNum: widget.auth.user.user.publicGistsCount),
				this.getTrendsIcon(Icons.notification_important, Colors.black.withOpacity(0.3), 'Private'),
				this.getTrendsIcon(Icons.settings_input_svideo, Colors.black.withOpacity(0.3), 'Owned'),
			]
		);
	}

	/// 趋势小图标
	Widget getTrendsIcon(IconData icon, Color color, String descTitle, {int descNum = 0}) {
		return Column(
			children: [
				Icon(icon, size: 20, color: color),
				Text('${descTitle.toString()} ${descNum.toString()}', style: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.w400))
			]
		);
	}

	/// 趋势分析块
	Widget getTrendsBlock() {
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: [
				this.getTrendsBlockItem(color: Color(0xFF4f50ad), icon: Icons.panorama_fish_eye, title: 'Followers count', trends: widget.auth.user.user.followersCount, increase:'+2%'),
				SizedBox(width: 20),
				this.getTrendsBlockItem(color: Color(0xFF68bef5), icon: Icons.cloud_download, title: 'Following Count', trends: widget.auth.user.user.followingCount, increase: '+0.5%')
			]
		);
	}

	Widget getTrendsBlockItem({Color color, IconData icon, String title, int trends, String increase}) {
		return Expanded(child: Container(
			height: 120,
			padding: EdgeInsets.fromLTRB(15, 15, 15, 20),
			decoration: BoxDecoration(
				borderRadius: BorderRadius.circular(8.0),
				color: color
			),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Row(
						children: [
							Icon(icon, size: 13, color: Colors.white),
							SizedBox(width: 5),
							Text(title, style: TextStyle(color: Colors.white, fontSize: 13))
						]
					),
					Spacer(),
					Row(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							Text(trends.toStringAsFixed(1), style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w300)),
							SizedBox(width: 7),
							Text(increase, style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 12))
						]
					)
				]
			),
		));
	}

	/// 进度条
	Widget getStackItem() {
		var percent = widget.auth.user.user.followersCount / widget.auth.user.user.followingCount;
		return Stack(
			children: <Widget>[
				Container(
					height: 6.0,
					decoration: BoxDecoration(
						borderRadius: BorderRadius.circular(12.0),
						color: Color(0xFFdce5e3)
					),
				),
				Container(
					width: MediaQuery.of(this.context).size.width * percent,
					height: 6.0,
					decoration: BoxDecoration(
						borderRadius: BorderRadius.circular(12.0),
						gradient: LinearGradient(
							begin: Alignment.centerLeft,
							end: Alignment.centerRight,
							colors: [
								Color(0xFF68bef5),
								Color(0xFF68bef5)
							]
						)
					),
				),
			],
		);
	}
}