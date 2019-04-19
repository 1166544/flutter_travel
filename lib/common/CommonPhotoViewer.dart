import 'package:flutter/material.dart';
import 'package:flutter_travel/common/CommonPhoto.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

const double _kMinFlingVelocity = 800.0;

class CommonPhotoViewer extends StatefulWidget {
  const CommonPhotoViewer({ Key key, this.photo, List<String> this.photoList, int this.photoIndex }) : super(key: key);

  final CommonPhoto photo;
  final List<String> photoList;
  final int photoIndex;

  @override
  _CommonPhotoViewerState createState() => _CommonPhotoViewerState();
}

class _CommonPhotoViewerState extends State<CommonPhotoViewer> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _flingAnimation;
  Offset _offset = Offset.zero;
  double _scale = 1.0;
  Offset _normalizedOffset;
  double _previousScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..addListener(_handleFlingAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // The maximum offset value is 0,0. If the size of this renderer's box is w,h
  // then the minimum offset value is w - _scale * w, h - _scale * h.
  Offset _clampOffset(Offset offset) {
    final Size size = context.size;
    final Offset minOffset = Offset(size.width, size.height) * (1.0 - _scale);
    return Offset(offset.dx.clamp(minOffset.dx, 0.0), offset.dy.clamp(minOffset.dy, 0.0));
  }

  void _handleFlingAnimation() {
    setState(() {
      _offset = _flingAnimation.value;
    });
  }

  void _handleOnScaleStart(ScaleStartDetails details) {
    setState(() {
      _previousScale = _scale;
      _normalizedOffset = (details.focalPoint - _offset) / _scale;
      // The fling animation stops if an input gesture starts.
      _controller.stop();
    });
  }

  void _handleOnScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = (_previousScale * details.scale).clamp(1.0, 4.0);
      // Ensure that image location under the focal point stays in the same place despite scaling.
      _offset = _clampOffset(details.focalPoint - _normalizedOffset * _scale);
    });
  }

  void _handleOnScaleEnd(ScaleEndDetails details) {
    final double magnitude = details.velocity.pixelsPerSecond.distance;
    if (magnitude < _kMinFlingVelocity)
      return;
    final Offset direction = details.velocity.pixelsPerSecond / magnitude;
    final double distance = (Offset.zero & context.size).shortestSide;
    _flingAnimation = Tween<Offset>(
      begin: _offset,
      end: _clampOffset(_offset + direction * distance)
    ).animate(_controller);
    _controller
      ..value = 0.0
      ..fling(velocity: magnitude / 1000.0);
  }

  @override
  Widget build(BuildContext context) {
	return Container(
		child: PhotoViewGallery(
			pageOptions: <PhotoViewGalleryPageOptions>[
				PhotoViewGalleryPageOptions(
					imageProvider: AssetImage(widget.photoList[0]),
					heroTag: widget.photo.tag
				),
				PhotoViewGalleryPageOptions(
					imageProvider: AssetImage(widget.photoList[1]),
					heroTag: widget.photo.tag,
					maxScale: PhotoViewComputedScale.covered * 0.3
				),
				PhotoViewGalleryPageOptions(
					imageProvider: AssetImage(widget.photoList[2]),
					heroTag: widget.photo.tag,
					maxScale: PhotoViewComputedScale.covered * 0.98
				),
			],
			backgroundDecoration: BoxDecoration(color: Colors.black87),
		),
	);
  }
}
