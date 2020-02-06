import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/common/CommonGalleryItem.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/common/CommonTimeFormate.dart';
import 'package:flutter_travel/modules/common/CommonTravelItem.dart';
import 'package:flutter_travel/modules/home/blocs/BlocComment.dart';
import 'package:flutter_travel/modules/home/models/ModelCommentData.dart';

/// 留言区
class CommentsPage extends StatefulWidget {
	final dynamic requestParams;
	
	CommentsPage({ Key key, @required this.requestParams}): super(key: key);

	@override
	_CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> with CommonNavigator {
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: this.getAppBar(context, '精选留言'),
			body: BlocProvider(
				bloc: blocComment,
				child: CommentPageContent(requestParams: widget.requestParams)
			)
		);
	}
}

/// 留言区详情页显示内容
class CommentPageContent extends StatefulWidget {
	
	final dynamic requestParams;
  	CommentPageContent({ Key key, @required this.requestParams}) : super(key: key);

	_CommentPageContentState createState() => _CommentPageContentState();
}

class _CommentPageContentState extends State<CommentPageContent> with CommonTravelItem, CommonTimeFormate, CommonNavigator {
	
	BlocComment blocCommentInfo;
 
	_CommentPageContentState(): super();

	@override
	Widget build(BuildContext context) {
		this.blocCommentInfo = BlocProvider.of<BlocComment>(context);
		this.blocCommentInfo.updateParams(widget.requestParams);

		return this.getStreamBuilder(context);
	}

	@override
	void dispose() {
		super.dispose();
		this.blocCommentInfo.dispose();
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<ModelCommentData>(
			stream: this.blocCommentInfo.outStream,
			builder: (context, snapshot) {
				if (snapshot.hasData) {
					return this.buildLayout(snapshot);
				} else {
					return this.buildEmptyLayout(context);
				}
			},
		);
	}

	/// 构建外观
	Widget buildLayout(AsyncSnapshot<ModelCommentData> snapshot) {
		return ListView(
			children: <Widget>[
				// 蓝色图片区
				this.buildBlueImageArea(snapshot),
				// 留言列表
				this.buildCommentListArear(snapshot)
			],
		);
	}

	/// 蓝色图片区
	Widget buildBlueImageArea(AsyncSnapshot<ModelCommentData> snapshot) {

		// 选择第1条数据
		ModelComments firstItem;
		if (snapshot.data.comments.length > 0) {
			firstItem = snapshot.data.comments[0];
		} else {
			return Container();
		}

		return Container(
			width: MediaQuery.of(this.context).size.width,
			height: 180.0,
			decoration: BoxDecoration(
				color: Color(0xFF5474e8),
				borderRadius: BorderRadius.circular(8.0),
				gradient: RadialGradient(
					center: Alignment(-0.9, 3),
					radius: 3.7,
					colors: [Color(0xFF5474e8), Color(0xFFcac0f8), Color(0xFFfeabb5)],
					stops: [0.3, 0.7, 1.5])
			),
			child: Padding(
			padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Text('CUSTOMER', style: TextStyle(color: Colors.black, fontSize: 10.0)),
					SizedBox(height: 10.0),
					Text('The king of sofa!', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold)),
					SizedBox(height: 10.0),
					Row(
						children: <Widget>[
							CircleAvatar(
								backgroundImage: CommentImageNetwork.imageNetwork(firstItem.userPic),
								radius: 25.0,
							),
							SizedBox(width: 12.0),
							Text(firstItem.userName, style: TextStyle(color: Color(0xFFc5e2fa), fontSize: 15.0)),
							Icon(Icons.favorite_border, color: Color(0xFFa2d1f8), size: 15.0,)
						],
					),
					SizedBox(height: 27.0),
					Row(
						children: <Widget>[
							Text('Henry, Bryce, ${firstItem.isReply}, +3', style: TextStyle(color: Color(0xFF374ca1), fontSize: 12.0)),
							Spacer(),
							Text(this.getFullTime(firstItem.ts.toString()), style: TextStyle(color: Color(0xFF374ca1), fontSize: 12.0)),
						],
					),
				],
			),
			),
		);
	}

	/// 留言列表`
	Widget buildCommentListArear(AsyncSnapshot<ModelCommentData> snapshot) {
		List<ModelComments> commentsListData = snapshot.data.comments;
		List<Widget> commentList = [];

		for (ModelComments item in commentsListData) {
			commentList.add(
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

		return Column(
			children: commentList,
		);
	}

	/// 标题
	/// * [PageCommentsVO item] 标题数据源
	Widget getTitle(ModelComments item) {
		return Padding(
			padding: EdgeInsets.fromLTRB(26.0, 5.0, 26.0, 0.0),
			child: Container(
				width: MediaQuery.of(this.context).size.width - 80.0,
				child: Text('${item.userName}', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Montserrat', color: Color(0xff5b6774), fontSize: 15, fontWeight: FontWeight.bold)),
			)
		);
	}

	/// 副标题
	Widget getSubTitle(ModelComments item) {
		return Padding(
			padding: EdgeInsets.fromLTRB(26.0, 20.0, 26.0, 0.0),
			child: Row(
				children: <Widget>[
					Text('一介草根 ${item.from}', style: TextStyle(color: Color(0xFFaeb2bc), fontSize: 10)),
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
			padding: EdgeInsets.fromLTRB(26.0, 10.0, 0.0, 0.0),
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
			padding: EdgeInsets.fromLTRB(26.0, 25.0, 20.0, 30.0),
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
					SizedBox(width: 20.0),
					this.buildCommentIcon(Icons.comment, int.parse(item.isReply))
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
