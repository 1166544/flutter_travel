import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocNetwork.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/core/http/HttpTransformerCore.dart';
import 'package:flutter_travel/core/manager/ManagerGlobal.dart';

/// 加载中显示网络及错误组件
class CommonLoading extends StatelessWidget {
	final Widget renderPage;
	CommonLoading({Key key, this.renderPage}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			bloc: ManagerGlobal.instance.getBlocNetworkInstance(),
			child: CommonLoadingPanel(renderPage: this.renderPage)
		);
	}
}

class CommonLoadingPanel extends StatefulWidget {
	final Widget renderPage;
	CommonLoadingPanel({Key key, this.renderPage}) : super(key: key);

	_CommonLoadingPanelState createState() => _CommonLoadingPanelState();
}

class _CommonLoadingPanelState extends State<CommonLoadingPanel> {

	BlocNetwork blocNetwork;

  	@override
	Widget build(BuildContext context) {
		this.blocNetwork = BlocProvider.of<BlocNetwork>(context);

		return StreamBuilder<HttpTransformResponse>(
			stream: this.blocNetwork.outStream,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					return CommonError(snapshot: snapshot.data);
				} else {
					// 支持自定义显示内容
					if (widget.renderPage != null) {
						return widget.renderPage;
					}
					return CommonSkeletonItem();
				}
			},
		);
	}
}

/// 圆形显示动画组件(所有骨架屏子类继承自它)
class CommonSkeletonItem extends StatefulWidget {
	CommonSkeletonItem({Key key}) : super(key: key);

	CommonSkeletonItemState createState() => CommonSkeletonItemState();
}
class CommonSkeletonItemState extends State<CommonSkeletonItem> with SingleTickerProviderStateMixin {
	
	AnimationController _controller;
	Animation _animation;

	@override
	void initState() {
		super.initState();
		this._controller = AnimationController(
			vsync: this,
			duration: Duration(seconds: 1),
		);
		this._animation = Tween(begin: 0.0, end: 1.0).animate(this._controller);
	}

	@override
	void dispose() {
		this._controller.dispose();
		super.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		this._controller.forward();

		return FadeTransition(
			opacity: this._animation,
			child: this.buildLayout(context)
		);
	}

	/// 构建布局(子类重定)
	Widget buildLayout(BuildContext context) {
		return Center(
			child: Container(
				width: 70,
				height: 70,
				child: FlareActor(
						"assets/animations/flare_loading.flr", 
						alignment:Alignment.center, 
						fit:BoxFit.contain, 
						animation:"Alarm"
					),
			)
		);
	}

	/// 返回骨架
	Widget getSkeletonItem({
		double width = 20, 
		double height = 20, 
		Color color = Colors.grey,
		BoxDecoration decoration
		}) {
		if (decoration != null) {
			return Container(
				width: width,
				height: height,
				decoration: decoration
			);
		} else {
			return Container(
				width: width,
				height: height,
				decoration: BoxDecoration(
					shape: BoxShape.rectangle,
					color: color
				),
			);
		}
	}
}


/// 网络错误提示页面组件
class CommonError extends StatelessWidget {
	final HttpTransformResponse snapshot;
	CommonError({Key key, this.snapshot}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Container(
				child: Text(
					'Sorry, 网络出了点故障~ \n描述: ${snapshot.errmsg} ${snapshot.errorDesc}\n状态码:${snapshot.errorStatus} \n地址:\n${snapshot.errorServer}', 
					maxLines: 5, 
					softWrap: true, 
					overflow: TextOverflow.ellipsis
				),
			)
		);
	}
}

