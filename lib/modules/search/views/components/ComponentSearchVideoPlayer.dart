import 'package:flutter/material.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchCards.dart';
// import 'package:video_player/video_player.dart';

/// 视频播放器
class ComponentSearchVideoPlayer extends StatefulWidget {
	final double videoWidth;
	final double videoHeight;
	final ModelSearchCards renderData;
	final String coverUrl = ManagerEnviroment.instance.getEnv().loginLogoUrl();

	ComponentSearchVideoPlayer({Key key, this.videoHeight, this.videoWidth, this.renderData}) : super(key: key);

	_ComponentSearchVideoPlayerState createState() => _ComponentSearchVideoPlayerState();
}

class _ComponentSearchVideoPlayerState extends State<ComponentSearchVideoPlayer> {

	// VideoPlayerController _videoController;

	@override
	void initState() {
		super.initState();
		// this._videoController = VideoPlayerController.network(dataSource)
	}

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
			child: Container(
				width: widget.videoWidth,
				height: widget.videoHeight,
				decoration: BoxDecoration(
					shape: BoxShape.rectangle,
					color: Color(0xFFe6e9f1),
					borderRadius: BorderRadius.circular(3.0)
				),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						SizedBox(height: 10),
						Padding(
							padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
							child: CommonText(
								'@${widget.renderData.mblog.pageInfo.pageTitle}: ${widget.renderData.mblog.pageInfo.content2}', 
								color: Colors.black.withOpacity(0.8)
							),
						),
						SizedBox(height: 8),
						Center(
							child: Container(
								width: widget.videoWidth - 14,
								height: widget.videoHeight - 40,
								decoration: BoxDecoration(
									shape: BoxShape.rectangle,
									image: DecorationImage(
										fit: BoxFit.cover,
										image: CommentImageNetwork.imageNetwork(widget.renderData.mblog.pageInfo.pagePic.url ?? widget.coverUrl)
									),
									borderRadius: BorderRadius.circular(3.0)
								),
								child: Center(
									child: Icon(Icons.play_arrow, size: 130, color: Colors.white.withOpacity(0.6))
								),
							)
						)
					]
				),
			),
		);
	}
}