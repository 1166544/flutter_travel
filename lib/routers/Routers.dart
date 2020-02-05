import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/navigation/NavigationTabCore.dart';
import 'package:flutter_travel/core/navigation/NavigationTabItem.dart';
import 'package:flutter_travel/modules/discover/DiscoverPage.dart';
import 'package:flutter_travel/modules/home/HomePage.dart';
import 'package:flutter_travel/modules/home/views/pages/PageSearchResult.dart';
import 'package:flutter_travel/modules/login/LoginPage.dart';
import 'package:flutter_travel/modules/profile/ProfilePage.dart';
import 'package:flutter_travel/modules/profile/views/pages/PageFormSubmit.dart';
import 'package:flutter_travel/modules/search/SearchPage.dart';
import 'package:flutter_travel/modules/splash/SplashPage.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:redux/redux.dart';

/// 路由结构
class Routers {
	Store<AppState> store;
	Map<NavigationTabItem, Widget> mapPageList;

	static String homePage = '/';
	static String loginPage = '/login';
	static String mainPage = '/main';
	static String searchPage = '/search';
	static String profileEditPage = '/edit';
	static String profilePage = '/profile';
	
	Routers({Store<AppState> store}) {
		this.store = store;
		this.mapPageList = new Map<NavigationTabItem, Widget>();
	}

	/// 主要页面通过枚举缓存
	getMainPageByEnum(NavigationTabItem tabItem) {
		try {
		  	if (this.mapPageList[tabItem] != null) {
				return this.mapPageList[tabItem];
			}
		} catch (e) {
			print(e);
		}

		switch (tabItem) {
			case NavigationTabItem.Home:
				// Home模块
				this.mapPageList[tabItem] = HomePage();
				break;
			case NavigationTabItem.Search:
				// 搜索模块
				this.mapPageList[tabItem] = SearchPage();
				break;
			case NavigationTabItem.Discover:
				// Discover模块
				this.mapPageList[tabItem] = DiscoverPage();
				break;
			case NavigationTabItem.Profile:
				// Profile模块
				this.mapPageList[tabItem] = ProfilePage();
				break;
		}

		return this.mapPageList[tabItem];
	}

	/// 初始化路由
	Map<String, WidgetBuilder> init() {
		return <String, WidgetBuilder> {
			// 首页
			Routers.homePage: (BuildContext context) => StoreConnector<AppState, dynamic>( 
				converter: (store) => store.state.auth.isAuthenticated, 
				builder: (BuildContext context, isAuthenticated) => isAuthenticated ? SplashPage() : LoginPage()
			),

			// 登录页
			Routers.loginPage: (BuildContext context) => LoginPage(),

			// 主页
			Routers.mainPage: (BuildContext context) {
				return NavigationTabCore();
			},

			// 搜索结果页
			Routers.searchPage: (BuildContext context) => PageSearchResult(),

			// 个人信息编辑页
			Routers.profileEditPage: (BuildContext context) => PageFormSubmit(),

			// 个人信息页
			Routers.profilePage: (BuildContext context) => this.getMainPageByEnum(NavigationTabItem.Profile)
		};
	}
}
