import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/discover/blocs/BlocDiscoverDetail.dart';
import 'package:flutter_travel/modules/discover/views/components/ComponentDiscoverCoverItem.dart';
import 'package:flutter_travel/modules/home/models/ModelContent.dart';

/// 封面TAB小图标
class ComponentDiscoverTile extends StatefulWidget {
	final List<ModelContent> displayList;
	final List<ModelContent> fullDisplayList;
	final ModelContent coverData;

	ComponentDiscoverTile({Key key, this.displayList, this.fullDisplayList, this.coverData}) : super(key: key);

	_ComponentDiscoverTileState createState() => _ComponentDiscoverTileState();
}

class _ComponentDiscoverTileState extends State<ComponentDiscoverTile> {

	bool isExpand = false;
	BlocDiscoverDetail blocData;
	ModelContent selectedItem;

	@override
	void initState() {
		super.initState();
		this.isExpand = false;
		this.selectedItem = widget.coverData;
	}

  	@override
  	Widget build(BuildContext context) {
		
		List<Widget> renderList = [];
		this.blocData = BlocProvider.of<BlocDiscoverDetail>(context);
		
		if (this.isExpand) {
			// 格子展开列表
			for (var i = 0; i < this.widget.fullDisplayList.length; i++) {
				renderList.add(this.buildCoverSlectItem(
					this.widget.fullDisplayList[i], 
					index: i, 
					selectedItem: this.selectedItem
				));
			}

			// 向上收缩按钮
			renderList.add(this.buildReduceMore(this.widget.displayList.length));

			return Container(
				width: MediaQuery.of(context).size.width,
				height: 280,
				child: GridView.count(
					crossAxisCount: 5,
					crossAxisSpacing: 3,
					mainAxisSpacing: 3,
					padding: EdgeInsets.all(4.0),
					childAspectRatio: 1,
					children: renderList,
				),
			);

		} else {
			// 简化列表
			for (var i = 0; i < this.widget.displayList.length; i++) {
				renderList.add(this.buildCoverSlectItem(
					this.widget.displayList[i], 
					index: i,
					selectedItem: this.selectedItem));
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
	Widget buildCoverSlectItem(ModelContent item, {int index, ModelContent selectedItem}) {
		return GestureDetector(
			onTap: () {
				this.selectedItem = item;
				this.updateCoverData();
			},
			child: Center(
				child: ComponentDiscoverCoverItem(item: item, index: index, selectedItem: this.selectedItem)
			)
		);
	}

	/// 小图点击时更新封面数据源
	void updateCoverData() {
		this.blocData.update(this.selectedItem);
	}

	// 展开所有小图
	void expandTile() {
		setState(() {
			this.isExpand = true;
		});
	}

	// 收缩所有小图
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

	/// 点击减少更多
	Widget buildReduceMore(int moreLength) {
		return GestureDetector(
			onTap: () {
				// 收缩所有小图
				this.shrinkTile();
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
								Icon(Icons.keyboard_arrow_up, size: 20, color: Colors.white)
							]
						),
					)
				),
			)
		);
	}
}