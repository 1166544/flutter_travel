import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/profile/models/ModelContributionsData.dart';
import 'package:flutter_travel/modules/profile/models/ModelLine.dart';
import 'package:flutter_travel/modules/profile/models/ModelProfile.dart';
import 'package:flutter_travel/redux/states/StateAuth.dart';

/// 数据统计表格
class ComponentProfileChart extends StatefulWidget {
	final StateAuth auth;
	final AsyncSnapshot<ModelProfile> snapshot;
 
	ComponentProfileChart({Key key, this.snapshot, this.auth}) : super(key: key);

	@override
	State<StatefulWidget> createState() => ComponentProfileChartState();
}

class ComponentProfileChartState extends State<ComponentProfileChart> {
	/// 图例数据
	List<ModelLine> lineNames;

	/// 图表数据
	List<LineChartBarData> chartDataList;

	@override
	void initState() {
		super.initState();
	}

	@override
	Widget build(BuildContext context) {

		if (widget.snapshot.data == null) {
			return Container();
		}

		// 拿出历史数据
		this.chartDataList = this.getPasedHistoryData();

		return AspectRatio(
				aspectRatio: 1.3,
				child: Container(
					padding: EdgeInsets.fromLTRB(0, 0.0, 0, 0),
					decoration: BoxDecoration(
					borderRadius: BorderRadius.all(Radius.circular(2)),
						color: Colors.white
					),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.stretch,
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							Text(
								'Years of code contribution trends',
								style: TextStyle(
									color: Colors.black,
									fontSize: 22,
									fontWeight: FontWeight.bold,
									letterSpacing: 0
								),
								textAlign: TextAlign.center,
							),
							SizedBox(
								height: 29,
							),
							this.getDescLabels(),
							SizedBox(
								height: 10,
							),
							Expanded(
								child: Padding(
									padding: EdgeInsets.only(right: 0.0, left: 0.0),
									child: LineChart(
										historyConfigData(),
										swapAnimationDuration: Duration(milliseconds: 250),
									),
								),
							),
						],
					),
				),
			);
  	}

	/// 构造图例
	Widget getDescLabels() {

		// 分离格子数据
		double deivdeNum = 4.0;
		double divideMaxSource = this.lineNames.length / deivdeNum;
		int divideMax = divideMaxSource.ceil();

		List<List<ModelLine>> colList = [];

		for (var i = 0; i < divideMax; i++) {
			List<ModelLine> insertList = [];
			colList.add(insertList);
		}

		for (var i = 0; i < this.lineNames.length; i++) {
			for (var k = 0; k < colList.length; k++) {
				List<ModelLine> insertList = colList[k];

				if (insertList.length < deivdeNum) {
					insertList.add(this.lineNames[i]);
					break;
				}
			}
		}

		return Column(
			children: colList.map((item) => getItemContainer(item)).toList()
		);
	}

	/// 图例列
	Widget getItemContainer(List<ModelLine> item) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: item.map(((subItem) => getSubItemContainer(subItem))).toList()
		);
	}

	/// 图例项
	Widget getSubItemContainer(ModelLine itemData) {
		return Container(
			padding: EdgeInsets.fromLTRB(10, 0, 10.0, 5.0),
			child: Row(
				children: [
					Text(
						'${itemData.name}: ', 
						style: TextStyle(
							fontSize: 13, 
							fontWeight: FontWeight.w300
						)
					),
					Container(
						width: 30,
						height: 7,
						decoration: BoxDecoration(
							color: itemData.color
						),
					),
				]
			)
		);
	}

	/// 图表数据源
	LineChartData historyConfigData() {
		return LineChartData(
			lineTouchData: LineTouchData(
				touchTooltipData: LineTouchTooltipData(
					tooltipBgColor: Color(0xFF4f50ad),
					getTooltipItems: (List<LineBarSpot> touchedSpots) {
						if (touchedSpots == null) {
							return null;
						}

						return touchedSpots.map((LineBarSpot touchedSpot) {
							if (touchedSpot == null) {
								return null;
							}
							final TextStyle textStyle = TextStyle(
								color: Colors.white,
								fontWeight: FontWeight.bold,
								fontSize: 14,
							);
							return LineTooltipItem((touchedSpot.y.toInt() * 10).toString(), textStyle);
						}).toList();
					}
				),
				touchCallback: (LineTouchResponse touchResponse) {
					print(touchResponse);
				},
				handleBuiltInTouches: true,
			),
			gridData: FlGridData(
				show: true,
			),
			titlesData: FlTitlesData(
				bottomTitles: SideTitles(
					showTitles: true,
					reservedSize: 0,
					textStyle: TextStyle(
						color: Colors.black,
						fontWeight: FontWeight.normal,
						fontSize: 10,
					),
					margin: 5,
					interval: 1,
					getTitles: (value) {
						switch (value.toInt()) {
							case 1:
								return 'Jan';
							case 2:
								return 'Feb';
							case 3:
								return 'Mar';
							case 4:
								return 'Apr';
							case 5:
								return 'May';
							case 6:
								return 'Jun';
							case 7:
								return 'Jul';
							case 8:
								return 'Aug';
							case 9:
								return 'Sept';
							case 10:
								return 'Oct';
							case 11:
								return 'Nov';
							case 12:
								return 'Dec';
						}
						return '';
					},
				),
				leftTitles: SideTitles(
					showTitles: true,
					textStyle: TextStyle(
						color: Colors.grey.withOpacity(0.5),
						fontWeight: FontWeight.w400,
						fontSize: 12,
					),
					getTitles: (value) {
						switch (value.toInt()) {
							case 0:
								return '0';
							case 2:
								return '20+';
							case 4:
								return '40+';
							case 6:
								return '60+';
							case 8:
								return '80+';
							case 10:
								return '100+';
						}
						return '';
					},
					margin: 12,
					reservedSize: 18,
					interval: 1
				),
			),
			borderData: FlBorderData(
				show: true,
				border: Border(
					bottom: BorderSide(
						color: Color(0xff4e4965),
						width: 0.5,
					),
					left: BorderSide(
						color: Colors.transparent,
					),
					right: BorderSide(
						color: Colors.transparent,
					),
					top: BorderSide(
						color: Colors.transparent,
					),
				),
			),
			minX: 0,
			maxX: 13,
			maxY: 10,
			minY: 0,
			lineBarsData: this.chartDataList,
		);
	}

	/// 筛选构造数据源
	List<LineChartBarData> getPasedHistoryData() {
		List<LineChartBarData> chartDataList = [];

		// 拿出历年数据
		List<ModelLine> lineNamesLocal = [];
		List<ModelContributionsYear> list = widget.snapshot.data.contributions.list;
		// 104 190 245
		int r = 104;
		int g = 190;
		int b = 245;

		for (var i = 0; i < list.length; i++) {
			Color color;
			int lastItem = list.length - 1;
			int lastSecondItem = list.length - 2;

			// 区别近两年颜色
			if (i == lastItem) {
				color = Color(0xFF4f50ad);
			} else if (i == lastSecondItem){
				color = Color(0xFF68bef5);
			} else {
				// 对RGB色码进行通道变幻
				r += 10;
				// g += 5;
				// b += 4;
			  	color = Color.fromARGB(255, r, g, b);
			}

			ModelContributionsYear item = list[i];
			lineNamesLocal.add(ModelLine(item.label, color));

			List<FlSpot> spotList = this.getSpotList(item);

			// 构造数据
			LineChartBarData lineChartBarData = LineChartBarData(
				spots: spotList,
				isCurved: true,
				colors: [
					color,
				],
				barWidth: 2,
				isStrokeCapRound: false,
				dotData: FlDotData(
					show: false,
					dotColor: Color(0xff67bdf3),
					dotSize: 3
				),
				belowBarData: BarAreaData(
					show: false,
				),
			);

			chartDataList.add(lineChartBarData);
		}

		this.lineNames = lineNamesLocal;

		return chartDataList;
	}

	/// 图表点
	List<FlSpot> getSpotList(ModelContributionsYear item) {
		List<FlSpot> spotList = [];
		for (var k = 0; k < item.list.length; k++) {
			ModelContributionsMonthData subItem = item.list[k];
			double lineY = this.getSpotMonthData(subItem.list) / 10;

			FlSpot lineSpot = FlSpot(double.parse(subItem.label), lineY);
			spotList.add(lineSpot);
		}

		return spotList;
	}

	/// 统计月数据
	double getSpotMonthData(List<ModelContributionsDayData> list) {
		double total = 0;
		for (var i = 0; i < list.length; i++) {
			total += list[i].count;
		}

		return total;
	}
}