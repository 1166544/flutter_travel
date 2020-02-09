import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/discover/views/components/ComponentDiscoverCoverItem.dart';
import 'package:flutter_travel/modules/home/models/ModelContent.dart';

class ComponentDiscoverTile extends StatefulWidget {
	final List<ModelContent> displayList;
	final List<ModelContent> fullDisplayList;

	ComponentDiscoverTile({Key key, this.displayList, this.fullDisplayList}) : super(key: key);

	_ComponentDiscoverTileState createState() => _ComponentDiscoverTileState();
}

class _ComponentDiscoverTileState extends State<ComponentDiscoverTile> {

	bool isExpand = false;

	@override
	void initState() {
		super.initState();
		this.isExpand = false;
	}

  	@override
  	Widget build(BuildContext context) {
		List<Widget> renderList = [];
		for (var i = 0; i < this.widget.displayList.length; i++) {
			renderList.add(this.buildCoverSlectItem(this.widget.displayList[i], index: i));
		}

		// 更多按钮
		renderList.add(this.buildRectMore(this.widget.fullDisplayList.length));

		return Padding(
			padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceAround,
				children: renderList
			)
		);
  	}

	/// 横向排列图片
	Widget buildCoverSlectItem(ModelContent item, {int index}) {
		return ComponentDiscoverCoverItem(item: item, index: index);
	}

	/// 点击添加更多
	Widget buildRectMore(int moreLength) {
		return GestureDetector(
			onTap: () {
				// 展开所有小图
			},
			child: Container(
				width: 60.0,
				height: 60.0,
				child: ClipRRect(
					borderRadius: BorderRadius.circular(8),
					child: Container(
						width: 60,
						height: 60,
						decoration: BoxDecoration(
							color: Colors.grey,
							shape: BoxShape.rectangle
						),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Text(
									'+${moreLength.toString()}', 
									style: TextStyle(
										fontSize: 15, 
										fontWeight: FontWeight.normal, 
										color: Colors.white
									)
								),
								Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.white)
							]
						),
					)
				),
			)
		);
	}
}