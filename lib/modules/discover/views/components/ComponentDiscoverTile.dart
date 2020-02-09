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
		
		if (this.isExpand) {
			// 格子列表
			for (var i = 0; i < this.widget.fullDisplayList.length; i++) {
				renderList.add(this.buildCoverSlectItem(this.widget.fullDisplayList[i], index: i));
			}

			// 向上收缩按钮
			// renderList.add(this.buildReduceMore(this.widget.fullDisplayList.length));

			return Container(
				width: MediaQuery.of(context).size.width,
				height: 280,
				child: GridView.count(
					crossAxisCount: 5,
					crossAxisSpacing: 3,
					mainAxisSpacing: 3,
					padding: EdgeInsets.all(4.0),
					childAspectRatio: 1.0,
					children: renderList,
				),
			);

		} else {
			// 简化列表
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

  	}

	/// 横向排列图片
	Widget buildCoverSlectItem(ModelContent item, {int index}) {
		return ComponentDiscoverCoverItem(item: item, index: index);
	}

	void expandTile() {
		setState(() {
			this.isExpand = true;
		});
	}

	void shrinkTile() {
		setState(() {
			this.isExpand = false;
		});
	}

	/// 点击添加更多
	Widget buildRectMore(int moreLength) {
		return GestureDetector(
			onTap: () {
				// 展开所有小图
				this.expandTile();
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

	/// 点击收缩更多
	// Widget buildReduceMore(int moreLength) {
	// 	return GestureDetector(
	// 		onTap: () {
	// 			// 收缩所有小图
	// 			this.shrinkTile();
	// 		},
	// 		child: this.buildCoverSlectItem(item: null, index: -100)
	// 	);
	// }
}