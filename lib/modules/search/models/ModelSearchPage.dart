import 'package:flutter_travel/modules/search/models/ModelSearchConfig.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchTabList.dart';

/// 页面初始数据源，包括ST和TAB列表
class ModelSearchPage {
	ModelSearchConfig config;
	ModelSearchTabList tabList;
	
	ModelSearchPage({this.config, this.tabList});
}