import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelImage.dart';
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
	final List<CirclerModelImage> galleryItems;

	@override
	State<StatefulWidget> createState() {
	return _CommonPhotoViewerState();
	}
}

class _CommonPhotoViewerState extends State<CommonPhotoViewer> with CommonNavigator {
	int currentIndex;
	String imageTitle;

	@override
	void initState() {
		currentIndex = widget.initialIndex;
		imageTitle = widget.galleryItems[widget.initialIndex].url;
		super.initState();
	}

	/// 页码更改处理
	/// * [int index] 页码
	void onPageChanged(int index) {
		setState(() {
			currentIndex = index;
			imageTitle = widget.galleryItems[currentIndex].url;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(leading: IconButton(
			icon: Icon(Icons.arrow_back_ios),
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
						imageProvider: NetworkImage(widget.galleryItems[index].urlWebp, headers: this.getCrossHeaders()),
						initialScale: PhotoViewComputedScale.contained * 0.95,
						minScale: PhotoViewComputedScale.contained * 0.95,
						maxScale: PhotoViewComputedScale.covered * 1.1,
						// heroTag: widget.galleryItems[index].id,
						);
					},
					itemCount: widget.galleryItems.length,
					loadingChild: widget.loadingChild,
					backgroundDecoration: widget.backgroundDecoration,
					pageController: widget.pageController,
					onPageChanged: onPageChanged,
					),
					Container(
					padding: const EdgeInsets.all(20.0),
					child: Row(
						crossAxisAlignment: CrossAxisAlignment.center,
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							Text(
								"${currentIndex + 1} / ${widget.galleryItems.length}", style: const TextStyle(fontFamily: 'Montserrat', color: Colors.white, fontSize: 17.0, decoration: null),
							)
						],
					),
					)
				],
			)),
		);
	}
}
