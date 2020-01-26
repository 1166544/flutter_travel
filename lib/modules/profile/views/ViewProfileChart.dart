import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// 数据统计表格
class ViewProfileChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ViewProfileChartState();
}

class ViewProfileChartState extends State<ViewProfileChart> {
	bool isShowingMainData;

	@override
	void initState() {
	super.initState();
	isShowingMainData = true;
	}

	@override
	Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
		padding: EdgeInsets.fromLTRB(0, 0.0, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
		  color: Color(0xFFe1e6f0)
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 37,
                ),
                Text(
                  'Unfold Shop 2020',
                  style: TextStyle(
                    color: Color(0xff827daa),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Monthly Sales',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0, left: 6.0),
                    child: LineChart(
                      isShowingMainData ? sampleData1() : sampleData2(),
                      swapAnimationDuration: Duration(milliseconds: 250),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.black.withOpacity(isShowingMainData ? 1.0 : 0.5),
              ),
              onPressed: () {
                setState(() {
                  isShowingMainData = !isShowingMainData;
                });
              },
            )
          ],
        ),
      ),
    );
  }

	/// 图表数据源
	LineChartData sampleData1() {
		return LineChartData(
			lineTouchData: LineTouchData(
				touchTooltipData: LineTouchTooltipData(
					tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
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
					reservedSize: 22,
					textStyle: TextStyle(
						color: Colors.black,
						fontWeight: FontWeight.normal,
						fontSize: 12,
					),
					margin: 7,
					getTitles: (value) {
						switch (value.toInt()) {
							case 2:
								return 'SEPT';
							case 7:
								return 'OCT';
							case 12:
								return 'DEC';
						}
						return '';
					},
				),
				leftTitles: SideTitles(
					showTitles: true,
					textStyle: TextStyle(
					color: Color(0xff75729e),
					fontWeight: FontWeight.bold,
					fontSize: 14,
					),
					getTitles: (value) {
					switch (value.toInt()) {
						case 1:
							return '1m';
						case 2:
							return '2m';
						case 3:
							return '3m';
						case 4:
							return '5m';
						}
						return '';
					},
					margin: 8,
					reservedSize: 30,
				),
			),
			borderData: FlBorderData(
				show: true,
				border: Border(
					bottom: BorderSide(
					color: Color(0xff4e4965),
					width: 1,
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
			maxX: 14,
			maxY: 4,
			minY: 0,
			lineBarsData: linesBarData1(),
		);
	}

	List<LineChartBarData> linesBarData1() {
		LineChartBarData lineChartBarData1 = LineChartBarData(
			spots: [
				FlSpot(1, 1),
				FlSpot(3, 1.5),
				FlSpot(5, 1.4),
				FlSpot(7, 3.4),
				FlSpot(10, 2),
				FlSpot(12, 2.2),
				FlSpot(13, 1.8),
			],
			isCurved: true,
			colors: [
				Colors.blueGrey.withOpacity(0.5),
			],
			barWidth: 4,
			isStrokeCapRound: true,
			dotData: FlDotData(
				show: false,
			),
			belowBarData: BarAreaData(
				show: false,
			),
		);
		final LineChartBarData lineChartBarData2 = LineChartBarData(
			spots: [
				FlSpot(1, 1),
				FlSpot(3, 2.8),
				FlSpot(7, 1.2),
				FlSpot(10, 2.8),
				FlSpot(12, 2.6),
				FlSpot(13, 3.9),
			],
			isCurved: true,
			colors: [
				Color(0xffaa4cfc),
			],
			barWidth: 4,
			isStrokeCapRound: true,
			dotData: FlDotData(
			show: false,
			),
			belowBarData: BarAreaData(show: false, colors: [
				Color(0x00aa4cfc),
			]),
		);
		LineChartBarData lineChartBarData3 = LineChartBarData(
			spots: [
				FlSpot(1, 2.8),
				FlSpot(3, 1.9),
				FlSpot(6, 3),
				FlSpot(10, 1.3),
				FlSpot(13, 2.5),
			],
			isCurved: true,
			colors: [
				Color(0xff27b6fc),
			],
			barWidth: 4,
			isStrokeCapRound: true,
			dotData: FlDotData(
				show: false,
			),
			belowBarData: BarAreaData(
				show: false,
			),
		);
		return [
			lineChartBarData1,
			lineChartBarData2,
			lineChartBarData3,
		];
	}

	LineChartData sampleData2() {
		return LineChartData(
			lineTouchData: LineTouchData(
				enabled: false,
			),
			gridData: FlGridData(
				show: false,
			),
			titlesData: FlTitlesData(
			bottomTitles: SideTitles(
				showTitles: true,
				reservedSize: 22,
				textStyle: TextStyle(
				color: Color(0xff72719b),
				fontWeight: FontWeight.normal,
				fontSize: 16,
				),
				margin: 10,
				getTitles: (value) {
				switch (value.toInt()) {
					case 2:
						return 'SEPT';
					case 7:
						return 'OCT';
					case 12:
						return 'DEC';
				}
				return '';
				},
			),
			leftTitles: SideTitles(
				showTitles: true,
				textStyle: TextStyle(
				color: Color(0xff75729e),
				fontWeight: FontWeight.bold,
				fontSize: 14,
				),
				getTitles: (value) {
				switch (value.toInt()) {
					case 1:
					return '1m';
					case 2:
					return '2m';
					case 3:
					return '3m';
					case 4:
					return '5m';
					case 5:
					return '6m';
				}
				return '';
				},
				margin: 8,
				reservedSize: 30,
			),
			),
			borderData: FlBorderData(
				show: true,
				border: Border(
				bottom: BorderSide(
					color: Color(0xff4e4965),
					width: 1,
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
				)),
			minX: 0,
			maxX: 14,
			maxY: 6,
			minY: 0,
			lineBarsData: linesBarData2(),
		);
	}

	List<LineChartBarData> linesBarData2() {
		return [
		LineChartBarData(
			spots: [
				FlSpot(1, 1),
				FlSpot(3, 4),
				FlSpot(5, 1.8),
				FlSpot(7, 5),
				FlSpot(10, 2),
				FlSpot(12, 2.2),
				FlSpot(13, 1.8),
			],
			isCurved: true,
			curveSmoothness: 0,
			colors: [
				Colors.blueAccent,
			],
			barWidth: 4,
			isStrokeCapRound: true,
			dotData: FlDotData(
			show: false,
			),
			belowBarData: BarAreaData(
			show: false,
			),
		),
		LineChartBarData(
			spots: [
				FlSpot(1, 1),
				FlSpot(3, 2.8),
				FlSpot(7, 1.2),
				FlSpot(10, 2.8),
				FlSpot(12, 2.6),
				FlSpot(13, 3.9),
			],
			isCurved: true,
			colors: [
				Colors.blueGrey,
			],
			barWidth: 2,
			isStrokeCapRound: true,
			dotData: FlDotData(
			show: false,
			),
			belowBarData: BarAreaData(show: true, colors: [
				Colors.blueGrey.withOpacity(0.3),
			]),
		),
		LineChartBarData(
			spots: [
			FlSpot(1, 3.8),
			FlSpot(3, 1.9),
			FlSpot(6, 5),
			FlSpot(10, 3.3),
			FlSpot(13, 4.5),
			],
			isCurved: true,
			curveSmoothness: 0,
			colors: [
			Colors.orangeAccent,
			],
			barWidth: 2,
			isStrokeCapRound: true,
			dotData: FlDotData(
			show: true,
			),
			belowBarData: BarAreaData(
			show: false,
			),
		),
		];
  }
}