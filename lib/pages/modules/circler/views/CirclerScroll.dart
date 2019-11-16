import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelImage.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';

/// 横向滚动内容
class CirclerScroll extends StatelessWidget {

	List<CirclerModelNewsItem> _list;

	CirclerScroll(List<CirclerModelNewsItem> list, {Key key}): super(key: key) {
		this._list = list;
	}

	@override
	Widget build(BuildContext context) {
		
		return Container(
				padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
				width: MediaQuery.of(context).size.width,
				height: 220.0,
				child: ListView(
					scrollDirection: Axis.horizontal,
					children: this.buildCoverIamge(),
				),
		);
	}

	/// 构建封面
	List<Widget> buildCoverIamge() {
		List<Widget> lsitWidget = [];
		int count = this._list.length;
		var cover2 = 'https://gss0.bdstatic.com/5foIcy0a2gI2n2jgoY3K/n/nvn/static/news/imgs/bg-news-logo_344ce44.png';
		for (var i = 0; i < count; i++) {
			CirclerModelNewsItem item = this._list[i];

			List<CirclerModelImage> imageurls = item.imageurls;
			var cover1 = '';

			if (imageurls.length > 0) {
				cover1 = imageurls[0].urlWebp;
			}

			if (imageurls.length > 1) {
				cover2 = imageurls[1].urlWebp;
			}

			lsitWidget.add(
				this.buildScrollImageItem(
						cover1,
						cover2,
						item.title)
			);

			if (i % 2 != 0) {
				lsitWidget.add(SizedBox(width: 15.0));
			}
		}

		return lsitWidget;
	}
	
	/// 滚动图片
	Widget buildScrollImageItem(
		String coverUrl, String avataUrl, String titleDesc) {
			
			return Container(
				width: 290.0,
				height: 180.0,
				decoration: BoxDecoration(
					image: DecorationImage(image: NetworkImage(coverUrl), fit: BoxFit.cover),
					borderRadius: BorderRadius.only(
						topLeft: Radius.circular(10.0),
						topRight: Radius.circular(10.0),
						bottomLeft: Radius.circular(10.0),
						bottomRight: Radius.circular(10.0),
					)),
				child: Container(
					padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
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
					child: Row(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.end,
						children: <Widget>[
							Container(
								width: 40.0,
								height: 40.0,
								decoration: BoxDecoration(
								image: DecorationImage(
										image: NetworkImage(avataUrl), fit: BoxFit.cover),
										borderRadius: BorderRadius.only(
											topLeft: Radius.circular(7.0),
											topRight: Radius.circular(7.0),
											bottomLeft: Radius.circular(7.0),
											bottomRight: Radius.circular(7.0),
								)),
							),
							SizedBox(width: 15.0),
							Container(
								height: 40.0,
								child: Text(titleDesc,
									maxLines: 2,
									softWrap: true,
									style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17.0, color: Colors.white)))
						],
					),
				),
			);

	}
}