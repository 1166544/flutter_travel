import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocNetwork.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/core/http/HttpTransformerCore.dart';
import 'package:flutter_travel/core/manager/ManagerGlobal.dart';

/// 加载中显示网络及错误组件
class CommonLoading extends StatelessWidget {
	const CommonLoading({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			bloc: ManagerGlobal.instance.getBlocNetworkInstance(),
			child: CommonLoadingPanel()
		);
	}
}

class CommonLoadingPanel extends StatefulWidget {
  CommonLoadingPanel({Key key}) : super(key: key);

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
					return CommonLoadingItem();
				}
			},
		);
	}
}

/// 圆形显示动画
class CommonLoadingItem extends StatelessWidget {
  	CommonLoadingItem({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
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
}

/// 网络错误提示
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

