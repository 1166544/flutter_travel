import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/common/CommonGalleryItem.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/common/CommonTimeFormate.dart';
import 'package:flutter_travel/modules/common/CommonTravelItem.dart';
import 'package:flutter_travel/modules/comments/CommentsPage.dart';
import 'package:flutter_travel/modules/home/blocs/BlocDetail.dart';
import 'package:flutter_travel/modules/home/models/ModelCommentCount.dart';
import 'package:flutter_travel/modules/home/models/ModelCommentData.dart';
import 'package:flutter_travel/modules/home/models/ModelContent.dart';
import 'package:flutter_travel/modules/home/models/ModelImage.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/modules/home/models/ModelPageData.dart';

/// 资讯详情页
class PageDetail extends StatefulWidget {
	
	final dynamic requestParams;
  	PageDetail({ Key key, @required this.requestParams}) : super(key: key);

	_PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> with CommonNavigator {

	_PageDetailState(): super();

	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				title: Text('NEWS DETAIL',
					style: TextStyle(
					color: Colors.black,
					fontWeight: FontWeight.bold,
					fontSize: 18.0
					)
				),
				leading: IconButton(
					icon: Icon(Icons.arrow_back_ios),
					color: Colors.black.withOpacity(0.8),
					onPressed: (){
						this.navigateBack(context);
					},
				),
				brightness: Brightness.light,
				centerTitle: true,
				elevation: 0.0,
				backgroundColor: Colors.grey.withOpacity(0.2)
			),
			body: BlocProvider(
				bloc: blocDetail,
				child: PageDetailContent(requestParams: widget.requestParams),
			),
		);
	}
}

/// 详情页显示内容
class PageDetailContent extends StatefulWidget {
	
	final dynamic requestParams;
  	PageDetailContent({ Key key, @required this.requestParams}) : super(key: key);

	_PageDetailContentState createState() => _PageDetailContentState();
}

class _PageDetailContentState extends State<PageDetailContent> with CommonTravelItem, CommonTimeFormate, CommonNavigator {
  
	BlocDetail blocDetailInfo;
 
	_PageDetailContentState(): super();

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocDetailInfo = BlocProvider.of<BlocDetail>(context);
		this.blocDetailInfo.updateParams(widget.requestParams);

		// 连接视图，下拉刷新
		return this.getStreamBuilder(context);
	}

	@override
	void dispose() {
		super.dispose();
		this.blocDetailInfo.dispose();
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<ModelPageData>(
			stream: this.blocDetailInfo.outStream,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					return this.buildLayout(snapshot);
				} else {
					return this.buildEmptyLayout(context);
				}
			}
		);
	}

	/// 构建外观
	Widget buildLayout(AsyncSnapshot<ModelPageData> snapshot) {
		List<ModelNewsItem> snapshotList = snapshot.data.detailInfo.news;
		ModelCommentCount snapshotComment = snapshot.data.commentInfo;

		if (snapshotList.length == 0) {
			return this.buildEmptyLayout(null);
		}

		ModelNewsItem contentItem = snapshotList[0];
		List<ModelContent> contentList = contentItem.content;
		int count = contentList.length;

		List<Widget> renderList = [
			// 标题
			this.getCircleTitle(contentItem),
			
			SizedBox(height: 7.0),

			// 副标题
			this.getCircleSubTitle(contentItem),
			
			SizedBox(height: 23.0),
		];

		// 内容
		for (var i = 0; i < count; i++) {
			ModelContent item = contentList[i];
			renderList.add(this.getCircleContent(item));
		}

		// 留言
		renderList.add(
			this.getCircleCommentBar(snapshotComment)
		);

		// 留言列表
		List<ModelComments> commentsListData = snapshot.data.commentListData.comments;

		for (ModelComments item in commentsListData) {
			renderList.add(
				Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						// 副标题
						this.getSubTitle(item),

						// 标题
						this.getTitle(item),

						// 描述文本
						this.getDescriptionArea(item),

						// 图片区
						this.getThumbilsArea(item),

						// 留言数量区
						this.getCommentsNumArea(item),
					],
				)
			);
		}

		return ListView(
			padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
			children: renderList,
		);
	}

	/// 标题
	Widget getCircleTitle(ModelNewsItem contentItem) {
		return Text(
			contentItem.title, 
			style: TextStyle(
				fontSize: 21.0, 
				color: Colors.black, 
				fontWeight: FontWeight.bold
			)
		);
	}

	/// 副标题
	Widget getCircleSubTitle(ModelNewsItem contentItem) {
		return Row(
			children: <Widget>[
				Text(
					contentItem.site, 
					style: TextStyle(
						fontSize: 11.0,
						color: Colors.grey,
					)
				),
				SizedBox(width: 7.0),
				Text(
					this.getFullTime(contentItem.ts), 
					style: TextStyle(
						fontSize: 14.0,
						color: Colors.grey,
					)
				)
			],
		);
	}

	/// 内容块
	Widget getCircleContent(ModelContent item) {
		if (item.type == 'text') {
			var replaceContent = '<div>${item.data.text}</div>';

			// 渲染文本
			return Padding(
				padding: EdgeInsets.fromLTRB(0, 8.0, 0, 18.0),
				child: Html(
					data: replaceContent,
					useRichText: true,
					defaultTextStyle: TextStyle(color: Colors.black, fontSize: 15.0),
				),
			);
		} else {
			// 渲染图片
			return GestureDetector(
				onTap: () {
					ModelNewsItem photoItem = new ModelNewsItem();
					photoItem.imageurls = [];
					ModelImage photoModel = ModelImage();
					photoModel.url = item.data.original.url;
					photoModel.urlWebp = photoModel.url;
					photoModel.width = item.data.original.width;
					photoModel.height = item.data.original.height;
					photoItem.imageurls.add(photoModel);
					photoItem.title = 'NEWS PHOTO';
					photoItem.content = [];
					this.showPhoto(this.context, photoItem, 0);
				},
				child: Image.network(item.data.original.url),
			);
		}
	}

	/// 留言数量条
	Widget getCircleCommentBar(ModelCommentCount snapshotComment) {
		return Padding(
				padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
				child: Row(
					children: <Widget>[
						Expanded(
							flex: 8,
							child: TextField(
								textAlign: TextAlign.left,
								style: TextStyle(fontSize: 12.0, color: Colors.black),
								decoration: InputDecoration(
									fillColor: Color(0xFFe4e9f5),
									filled: true,
									labelText: snapshotComment.data.comment > 0 ? '共有 ${snapshotComment.data.comment} 条留言' : '',
									labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
									prefixIcon: Container(
										child: Icon(Icons.comment, color: Colors.black.withOpacity(0.6), size: 26.0),
									),
									suffixText: 'Enter comment words',
									border: InputBorder.none,
								),
								onChanged: (text) {
									print('change $text');
								},
								onSubmitted: (text) {
									print('submit $text');
								}
							)
						),
						this.getJumpToNextButton(snapshotComment.data.comment),
				],
			),
		);
	}

	/// 跳转到留言页
	Widget getJumpToNextButton(int commentLength) {
		return Expanded(
			child: IconButton(
				icon:Icon(Icons.airplay),
				color: Colors.black,
				iconSize: 30.0,
				onPressed: (){
					if (commentLength > 0) {
						this.navigateTo(context, new CommentsPage(requestParams: widget.requestParams));
					}
				}
			),
		);
	}

	/// 标题
	/// * [PageCommentsVO item] 标题数据源
	Widget getTitle(ModelComments item) {
		return Padding(
			padding: EdgeInsets.fromLTRB(15.0, 5.0, 26.0, 0.0),
			child: Container(
				width: MediaQuery.of(this.context).size.width - 80.0,
				child: Text('${item.userName}', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Montserrat', color: Color(0xff5b6774), fontSize: 15, fontWeight: FontWeight.bold)),
			)
		);
	}

	/// 副标题
	Widget getSubTitle(ModelComments item) {
		return Padding(
			padding: EdgeInsets.fromLTRB(15.0, 20.0, 26.0, 0.0),
			child: Row(
				children: <Widget>[
					Text('一介草根 ${item.from}', style: TextStyle(color: Color(0xFFaeb2bc), fontSize: 12)),
					Spacer(),
					this.getSubTitleNum(0)
				],
			),
		);
	}

	/// 子标题数量
	///  * [int postTitleNum] 显示数字
	Widget getSubTitleNum(int postTitleNum) {
		Color backgroundColor;
		Color fontColor;

		if (postTitleNum > 0) {
			backgroundColor = Color(0xFFffe0b9);
			fontColor = Color(0xFFe99934);
		}

		if (postTitleNum > 5) {
			backgroundColor = Color(0xFFafcdee);
			fontColor = Color(0xFF004da1);
		}

		return postTitleNum > 0 ? Container(
			width: 18.0,
			height: 18.0,
			decoration: BoxDecoration(
				color: backgroundColor,
				shape: BoxShape.rectangle,
				borderRadius: BorderRadius.circular(3.0)
			),
			child: Center(
				child: Text(
					postTitleNum.toString(),
					style: TextStyle(
						color: fontColor,
						fontSize: 10,
						fontWeight: FontWeight.bold
					)
				)
			),
		) : Container();
	}

	/// 描述文本
	/// * [PageCommentsVO item] 描述数据列表
	Widget getDescriptionArea(ModelComments item) {
		double containerWidth = MediaQuery.of(this.context).size.width - 50.0;
		double textWidth = containerWidth - 40;

		return Padding(
			padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
			child: Container(
				width: containerWidth,
				child: Row(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						CircleAvatar(
							backgroundImage: CommentImageNetwork.imageNetwork(item.userPic),
							radius: 15.0,
						),
						SizedBox(width: 10.0),
						Container(
							width: textWidth,
							child: Text(
							item.text,
							maxLines: 8,
							softWrap: true,
							overflow: TextOverflow.ellipsis,
							style: TextStyle(
								color: Colors.black,
								fontSize: 12,
								fontWeight: FontWeight.normal
								)
							),
						)
					],
				),
			)
		);
	}

	/// 图片区
	/// * [PageCommentsVO item] 图片数据项
	Widget getThumbilsArea(ModelComments  item) {
		List<Widget> thumbilsList = [];
		int index = 0;
		for (CommonGalleryItem itemVO in item.thumbList) {
		thumbilsList.add(
			InkWell(
				onTap: () {
					// this.showPhoto(item, itemVO.index);
				},
				child: Container(
					width: 120.0,
					height: 80.0,
					margin: EdgeInsets.only(top: 5.0, right: 5.0),
					decoration: BoxDecoration(
						image: DecorationImage(
							image: AssetImage(itemVO.image),
							fit: BoxFit.cover
						),
						borderRadius: BorderRadius.circular(5.0)
					),
				),
			)
		);
		itemVO.index = index;
		index++;
		}

		return item.thumbList.length > 0 ?
		Container(
			margin: EdgeInsets.fromLTRB(26.0, 10.0, 0.0, 0.0),
			width: MediaQuery.of(this.context).size.width,
			height: 80,
			child: ListView(
				padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
				scrollDirection: Axis.horizontal,
				children: thumbilsList,
			),
		) :
		Container();
	}

	/// 留言数量区
	/// * [PageCommentsVO item] 留言数据
	Widget getCommentsNumArea(ModelComments item) {
		return Padding(
			padding: EdgeInsets.fromLTRB(15.0, 25.0, 20.0, 30.0),
			child: Row(
				children: <Widget>[
					Text(
						this.getFullTime(item.ts.toString()),
						style: TextStyle(
							color: Color(0xFF5f6f7f).withOpacity(0.5),
							fontSize: 10
						)
					),
					Spacer(),
					this.buildCommentIcon(Icons.favorite_border, int.parse(item.supportCount)),
				],
			),
		);
	}

	/// 留言区图标按钮
	Widget buildCommentIcon(IconData iconComment, int commentNum) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.start,
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Container(
					width: 12.0,
					height: 12.0,
					child: IconButton(
					padding: EdgeInsets.all(0.0),
						icon: Icon(iconComment, color: Color(0xFF5f6f7f).withOpacity(0.5), size: 12.0),
						onPressed: () {},
					)
				),
				SizedBox(width: 5.0),
				Text(
					commentNum.toString(),
					style: TextStyle(
						color: Color(0xFF5f6f7f).withOpacity(0.5),
						fontSize: 10
						)
				)
			],
		);
	}
	
}