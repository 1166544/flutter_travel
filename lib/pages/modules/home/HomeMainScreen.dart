import 'package:flutter/material.dart';
import 'package:flutter_travel/core/presentation/PresentationPlatformAdaptive.dart';
import 'package:flutter_travel/pages/modules/home/HomeMainDrawer.dart';
import 'package:flutter_travel/pages/modules/home/tabs/HomeDiscover.dart';
import 'package:flutter_travel/pages/modules/home/tabs/HomeNews.dart';
import 'package:flutter_travel/pages/modules/home/tabs/HomeStats.dart';
import 'package:flutter_travel/styles/StyleTexts.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();

}
class MainScreenState extends State<MainScreen> {
    
    PageController _tabController;
    String _title;
    int _index;

    @override
    void initState() {
        super.initState();
        _tabController = PageController();
        _title = TabItems[0].title;
        _index = 0;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            
            appBar: PlatformAdaptiveAppBar(
                title: Text(_title),
                platform: Theme.of(context).platform
            ),
            
            bottomNavigationBar: PlatformAdaptiveBottomBar(
                currentIndex: _index,
                onTap: onTap,
                items: TabItems.map((TabItem item) {
                    return BottomNavigationBarItem(
                        title: Text(
                            item.title,
                            style: textStyles['bottom_label'],
                        ),
                        icon: Icon(item.icon),
                    );
                }).toList(),
            ),

            body: PageView(
                controller: _tabController,
                onPageChanged: onTabChanged,
                children: <Widget>[
                    NewsTab(),
                    StatsTab(),
                    DiscoverTab()
                ],
            ),

            drawer: MainDrawer(),
        );
    }

    void onTap(int tab){
        _tabController.jumpToPage(tab);
    }

    void onTabChanged(int tab) {
        setState((){
            this._index = tab;
        });
        
        this._title = TabItems[tab].title;
    }

}

class TabItem {
    final String title;
    final IconData icon;

    const TabItem({ this.title, this.icon });
}

const List<TabItem> TabItems = const <TabItem>[
    const TabItem(title: 'News', icon: Icons.assignment),
    const TabItem(title: 'Statistics', icon: Icons.timeline),
    const TabItem(title: 'Discover', icon: Icons.group_work)
];