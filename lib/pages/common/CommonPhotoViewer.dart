import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelContent.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

/// 图片预览
class CommonPhotoViewer extends StatefulWidget {
	CommonPhotoViewer(
		{this.loadingChild,
		this.backgroundDecoration,
		this.minScale,
		this.maxScale,
		this.initialIndex,
		@required this.galleryItems})
		: pageController = PageController(initialPage: initialIndex);

	final Widget loadingChild;
	final Decoration backgroundDecoration;
	final dynamic minScale;
	final dynamic maxScale;
	final int initialIndex;
	final PageController pageController;
	final CirclerModelNewsItem galleryItems;

	@override
	State<StatefulWidget> createState() {
	return _CommonPhotoViewerState();
	}
}

class _CommonPhotoViewerState extends State<CommonPhotoViewer> with CommonNavigator {
	int currentIndex;
	String imageTitle;
	List<CommentPhotoViewerData> list = [];

	void buildGalleryData() {
		// 添加三张封面内容
		var itemList = widget.galleryItems.imageurls;
		var item = widget.galleryItems;
		for (var i = 0; i < itemList.length; i++) {
			if (i == 0) {
				this.list.add(CommentPhotoViewerData(itemList[i].url, item.title));
			}
			if (i == 1) {
				this.list.add(CommentPhotoViewerData(itemList[i].url, item.abs));
			}
			if (i == 2) {
				this.list.add(CommentPhotoViewerData(itemList[i].url, item.site));
			}
		}

		// 添加内容插图
		List<CirclerModelContent> contentList = [];
		List<CirclerModelContent> imageList = [];
		for (var i = 0; i < widget.galleryItems.content.length; i++) {
			CirclerModelContent item = widget.galleryItems.content[i];

			if (item.type == 'text') {
				contentList.add(item);
			} else {
				imageList.add(item);
			}
		}

		// 合并插图
		for (var i = 0; i < imageList.length; i++) {
			CirclerModelContent item = imageList[i];

			if (i < contentList.length) {
				this.list.add(CommentPhotoViewerData(item.data.original.url, contentList[i].data.text));
			} else {
				this.list.add(CommentPhotoViewerData(item.data.original.url, widget.galleryItems.title));
			}
		}
	}

	@override
	void initState() {
		currentIndex = widget.initialIndex;
		imageTitle = widget.galleryItems.title;
		this.buildGalleryData();
		super.initState();
	}

	/// 页码更改处理
	/// * [int index] 页码
	void onPageChanged(int index) {
		setState(() {
			currentIndex = index;
			// imageTitle = widget.galleryItems[currentIndex].url;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(leading: IconButton(
				icon: Icon(Icons.arrow_back_ios, color: Colors.white),
				onPressed: () {
					Navigator.of(context).pop();
				}),
				title: Text(
					"$imageTitle",
					style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')
				),
				centerTitle: true,
				elevation: 0.0,
				backgroundColor: Colors.black,
			),
			body: Container(
				decoration: widget.backgroundDecoration,
				constraints: BoxConstraints.expand(
					height: MediaQuery.of(context).size.height,
				),
				child: Stack(
					alignment: Alignment.bottomRight,
					children: <Widget>[
						PhotoViewGallery.builder(
							scrollPhysics: const BouncingScrollPhysics(),
							builder: (BuildContext context, int index) {
								return PhotoViewGalleryPageOptions(
									imageProvider: NetworkImage(this.list[index].url, headers: this.getCrossHeaders()),
									initialScale: PhotoViewComputedScale.contained * 0.95,
									minScale: PhotoViewComputedScale.contained * 0.95,
									maxScale: PhotoViewComputedScale.covered * 1.1,
									// heroTag: widget.galleryItems[index].id,
								);
							},
							itemCount: this.list.length,
							loadingChild: widget.loadingChild,
							backgroundDecoration: widget.backgroundDecoration,
							pageController: widget.pageController,
							onPageChanged: onPageChanged,
						),
						Container(
							padding: const EdgeInsets.all(20.0),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								mainAxisAlignment: MainAxisAlignment.end,
								children: <Widget>[
									Text(
										this.list[this.currentIndex].desc, style: TextStyle(color: Colors.white, fontSize: 17.0, decoration: null),
									),
									Text(
										"${currentIndex + 1} / ${this.list.length}", style: TextStyle(color: Colors.white, fontSize: 17.0, decoration: null),
									)
								],
							),
						)
					],
				)
			),
		);
	}
}

class CommentPhotoViewerData {
	final String url;
	final String desc;

	CommentPhotoViewerData(this.url, this.desc);
}
