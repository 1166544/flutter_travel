import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelImage.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/pages/modules/home/views/pages/PageDetail.dart';

/// 横向滚动内容
class ComponentScroll extends StatelessWidget with CommonNavigator {

	final List<ModelNewsItem> list;
	final String cover2 = 'https://gss0.bdstatic.com/5foIcy0a2gI2n2jgoY3K/n/nvn/static/news/imgs/bg-news-logo_344ce44.png';

	ComponentScroll(this.list, {Key key}): super(key: key);

	@override
	Widget build(BuildContext context) {
		
		return Container(
				padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
				width: MediaQuery.of(context).size.width,
				height: 220.0,
				child: ListView(
					scrollDirection: Axis.horizontal,
					children: this.buildCoverIamge(context),
				),
		);
	}

	/// 构建封面
	List<Widget> buildCoverIamge(BuildContext context) {
		List<Widget> lsitWidget = [];
		int count = this.list.length;
		
		for (var i = 0; i < count; i++) {
			ModelNewsItem item = this.list[i];
			lsitWidget.add(this.buildScrollImageItem(item, context));
			lsitWidget.add(SizedBox(width: 15.0));
		}

		return lsitWidget;
	}
	
	/// 滚动图片
	Widget buildScrollImageItem(ModelNewsItem item, BuildContext context) {
		
		List<ModelImage> imageurls = item.imageurls;
		var cover1 = '';

		if (imageurls.length > 0) {
			cover1 = imageurls[0].urlWebp;
		}

		var coverCopy = this.cover2;
		if (imageurls.length > 1) {
			coverCopy = imageurls[1].urlWebp;
		}
			
		return Container(
			width: 290.0,
			height: 180.0,
			decoration: BoxDecoration(
				image: DecorationImage(
					image: NetworkImage(cover1), 
					fit: BoxFit.cover,
				),
				borderRadius: BorderRadius.only(
					topLeft: Radius.circular(10.0),
					topRight: Radius.circular(10.0),
					bottomLeft: Radius.circular(10.0),
					bottomRight: Radius.circular(10.0),
				),
				border: Border.all(
					color: Colors.grey.withOpacity(0.3), width: 0.5
				)
				),
			child: Container(
					padding: EdgeInsets.fromLTRB(10.0, 0, 7.0, 10.0),
					decoration: BoxDecoration(
						gradient: LinearGradient(
							begin: Alignment.topCenter,
							end: Alignment.bottomCenter,
							stops: [0.0, 0.5, 0.65, 0.9],
							colors: [
								Colors.black.withOpacity(0.0),
								Colors.black.withOpacity(0.3),
								Colors.black.withOpacity(0.5),
								Colors.black.withOpacity(0.7),
							],
						),
						borderRadius: BorderRadius.only(
						topLeft: Radius.circular(10.0),
						topRight: Radius.circular(10.0),
						bottomLeft: Radius.circular(10.0),
						bottomRight: Radius.circular(10.0),
					)
					),
					child: GestureDetector(
						// 透明区域响应点击
						behavior: HitTestBehavior.opaque,
						onTap: () => {
							this.navigateTo(context, PageDetail(requestParams: {
								'nids': item.nid
							}))
						},
						child: Row(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.end,
							children: <Widget>[
								Container(
									width: 40.0,
									height: 40.0,
									decoration: BoxDecoration(
									image: DecorationImage(
											image: NetworkImage(coverCopy), fit: BoxFit.cover),
											borderRadius: BorderRadius.only(
												topLeft: Radius.circular(7.0),
												topRight: Radius.circular(7.0),
												bottomLeft: Radius.circular(7.0),
												bottomRight: Radius.circular(7.0),
									)),
								),
								SizedBox(width: 10.0),
								Container(
									width: 220.0,
									height: 40.0,
									child: Text(item.title,
										maxLines: 2,
										softWrap: true,
										style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0, color: Colors.white)))
							],
						)
					)
				),
		);
	}
}