import 'package:flutter_travel/pages/common/CommonGalleryItem.dart';

/// 留言区数据结构
class CommentsPageVO {
	CommentsPageVO(
		{
			this.avataUrl,
			this.postTitle,
			this.postTitleNum,
			this.title,
			this.description,
			this.commentDate,
			this.likeNum,
			this.commentsNum,
			this.commentsImageList
		}
	);

	String postTitle;
	String avataUrl;
	int postTitleNum;
	String title;
	String description;
	String commentDate;
	int likeNum;
	int commentsNum;
	List<CommonGalleryItem> commentsImageList = [];

    /// 拿测试数据
	List<CommentsPageVO> getTestData() {
		List<CommentsPageVO> commentsList = [];
		// 模拟数据源
		commentsList.add(new CommentsPageVO(
			avataUrl: 'assets/chris.jpg',
			postTitle: 'PROSPECT',
			postTitleNum: 3,
			title: 'Jessica Hische',
			description: "In that Widget, I don't need to rewrite the circle image, because I've already built it once.",
			commentDate: '2 Aug, 2019',
			likeNum: 1623,
			commentsNum: 2,
			commentsImageList: []
		));
		commentsList.add(new CommentsPageVO(
			avataUrl: 'assets/p1.jpg',
			postTitle: 'PROSPECT',
			postTitleNum: 0,
			title: 'How Ifind Inspiration',
			description: "The most important part of using Flutter Widgets effectively is designing your lowest level widgets to be reusable.",
			commentDate: '2 Jun, 2018',
			likeNum: 1623,
			commentsNum: 2,
			commentsImageList: [
				CommonGalleryItem(id: 0.toString(), image: 'assets/beach5.jpg', description: 'A drink in beach'),
				CommonGalleryItem(id: 1.toString(), image: 'assets/beach6.jpg', description: 'A shoes in under the sun'),
				CommonGalleryItem(id: 2.toString(), image: 'assets/beach4.jpg', description: 'Cross the bridge.'),
				CommonGalleryItem(id: 3.toString(), image: 'assets/p3.jpg', description: 'A drink in beach'),
				CommonGalleryItem(id: 4.toString(), image: 'assets/p5.jpg', description: 'A shoes in under the sun'),
				CommonGalleryItem(id: 5.toString(), image: 'assets/p2.jpg', description: 'Cross the bridge.'),
			]
		));
		commentsList.add(new CommentsPageVO(
			avataUrl: 'assets/p2.jpg',
			postTitle: 'CUSTOMER',
			postTitleNum: 2,
			title: 'Rovane Durso',
			description: "In that Widget, I don't need to rewrite the circle image, because I've already built it once.",
			commentDate: '22 Feb, 2018',
			likeNum: 25,
			commentsNum: 56,
			commentsImageList: []
		));
		commentsList.add(new CommentsPageVO(
			avataUrl: 'assets/p3.jpg',
			postTitle: 'PROSPECT',
			postTitleNum: 8,
			title: 'Dark Patterns: The Devil in Mobile UI UX Design?',
			description: "The green outline represents the page. And a page in Flutter is a widget. The blue outlines represent pieces of UI that logically group together. The rest are outlined white, and they're simply dumb components that have no concern over their content, they just display what they're told.",
			commentDate: '2 May, 2018',
			likeNum: 852,
			commentsNum: 159,
			commentsImageList: []
		));

		return commentsList;
	}
}
