import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/profile/models/ModelProfile.dart';
import 'package:flutter_travel/modules/profile/views/components/ComponentProfileComment.dart';

/// 中实现信息
class ComponentPresciption extends StatefulWidget {
	final AsyncSnapshot<ModelProfile> snapshot;
  	ComponentPresciption({Key key, this.snapshot}) : super(key: key);

  	_ComponentPresciptionState createState() => _ComponentPresciptionState();
}

class _ComponentPresciptionState extends State<ComponentPresciption> with ComponentProfileComment {
  @override
  Widget build(BuildContext context) {

	  	if (widget.snapshot.data == null) {
			return Container();
		}

		return Container(
				padding: EdgeInsets.fromLTRB(20.0, 55.0, 20.0, 45.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						this.getUnderlineText('Prescription'),
						SizedBox(height: 15.0),
						Container(
							decoration: BoxDecoration(
								color: Color(0xFFe1e6f0)
							),
							padding: EdgeInsets.all(18.0),
							child: Column(
								children: <Widget>[
									this.getPresciptonItem('Range start', widget.snapshot.data.contributions.range.start),
									SizedBox(height: 12),
									this.getPresciptonItem('Range end', widget.snapshot.data.contributions.range.end),
									SizedBox(height: 12),
									this.getPresciptonItem('Flag of year flag', widget.snapshot.data.contributions.year),
								],
							),
						),
						SizedBox(height: 15.0),
						CommonText(
							widget.snapshot.data.contributions.total.toStringAsFixed(1),
							style: TextStyle(
								fontSize: 30.0,
								color: Colors.black,
								fontWeight: FontWeight.bold
							)
						),
						Row(
							children: <Widget>[
								CommonText(
									'Total contributions counts of this year',
									maxLines: 2,
									overflow: TextOverflow.ellipsis,
									style: TextStyle(
										fontSize: 14.0,
										color: Color(0xFF9395a3)
									)
								),
								Icon(Icons.arrow_right, color: Color(0xFF9395a3))
							],
						)
				]
			)
		);
  	}
  
	/// 实现横条内容
	Widget getPresciptonItem(String title, String subTitle) {
		return Row(
			children: <Widget>[
				CommonText(
					title,
					style: TextStyle(
						fontSize: 12.0,
						color: Colors.black
					)
				),
				Spacer(),
				CommonText(
					subTitle,
					style: TextStyle(
						fontSize: 12.0,
						color: Colors.black,
						fontWeight: FontWeight.bold
					)
				)
			],
		);
	}

}