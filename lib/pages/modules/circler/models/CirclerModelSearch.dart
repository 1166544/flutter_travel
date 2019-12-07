
/// 搜索结果页数据
class CirclerModelSearch {
	List<dynamic> ecData;	
	String query;
	String lid;
	bool hasMoreResult;
	bool isNewTpl;
	bool isNewDisp;
	List<CircleModelSearchItem> list = [];
	dynamic recommendSwitch;
	dynamic queryInsertIndex;
	bool lTxtRImg;
	bool hasMore;

	CirclerModelSearch();

	/// 更新数据
	void update(dynamic resultData) {
		dynamic result = resultData.data;

		if (result != null) {
			dynamic resultSubData = result['data'];

			this.ecData = resultSubData['ecData'];	
			this.query = resultSubData['query'];
			this.lid = resultSubData['lid'];
			this.hasMoreResult = resultSubData['hasMoreResult'];
			this.isNewTpl = resultSubData['isNewTpl'];
			this.isNewDisp = resultSubData['isNewDisp'];
			this.recommendSwitch = resultSubData['recommendSwitch'];
			this.queryInsertIndex = resultSubData['queryInsertIndex'];
			this.lTxtRImg = resultSubData['lTxtRImg'];
			this.hasMore = resultSubData['hasMore'];

			dynamic list = resultSubData['list'];
			for(Map item in list) {
				CircleModelSearchItem itemData = new CircleModelSearchItem();
				itemData.update(item);
				this.list.add(itemData);
			}
		}
	}
}

class CircleModelSearchItem {
	int index;
	String size;
	String title;
	int isDispAbstract;
	String posttime;
	String subsitename;
	String subsitenameNew;
	String avatar;
	String avatarUrl;
	String abstractValue;
	String site;
	String threadId;
	String pd;
	String titleurl;
	int isSf;
	int urlType;
	String type;
	dynamic isPicExp;
	List<String> img = [];
	String imgsrcurl;
	String isEnd;
	String url;
	String tcUrl;
	dynamic params;
	int comments;

	CircleModelSearchItem();

	void update(dynamic data) {
		this.index = data['index'];
		this.size = data['size'];
		this.title = data['title'];
		this.isDispAbstract = data['is_disp_abstract'];
		this.posttime = data['posttime'];
		this.subsitename = data['subsitename'];
		this.subsitenameNew = data['subsitename_new'];
		this.avatar = data['avatar'];
		this.avatarUrl = data['avatarUrl'];
		this.abstractValue = data['abstract'];
		this.site = data['site'];
		this.threadId = data['thread_id'];
		this.pd = data['pd'];
		this.titleurl = data['titleurl'];
		this.isSf = data['is_sf'];
		this.urlType = data['url_type'];
		this.type = data['type'];
		this.isPicExp = data['is_pic_exp'];
		this.imgsrcurl = data['imgsrcurl'];
		this.isEnd = data['is_end'];
		this.url = data['url'];
		this.tcUrl = data['tcUrl'];
		this.params = data['params'];
		this.comments = data['comments'];
		var img = data['img'];

		if (img != null) {
			for (var i = 0; i < img.length; i++) {
				this.img.add(img[i]);
			}
		}
	}
}
