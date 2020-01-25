
import 'package:flutter_travel/pages/modules/home/models/ModelContent.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelContentType.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelCtag.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelExt.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelFeedBackTag.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelImage.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelTags.dart';

/// 新闻详情内容
class ModelNewsItem {
	List<ModelContent> content;
	ModelContentType contentType;
	ModelCtag ctag;
	List<ModelFeedBackTag> feedbackTag;
	ModelExt ext;
	List<ModelImage> imageurls;
	ModelTags tags;
	List<dynamic> topic = [];
	List<dynamic> hasRelated = [];

	dynamic emojis = {};
	String abs = "...";
	int chinajoy = 0;
	String commentCount = "0";
	String cornerContent = "6";
	String cornerType = "image";
	int displayType = 2;
	String displayUrl = "";
	String layout = "bigimage";
	String longAbs = "";
	String nType = "1";
	String nid = "10008145313073716783";
	String pulltime = "1573873768383";
	int sentimentDisplay = 0;
	String site = "图影视界";
	String sourcets = "1573224902000";
	String title = "";
	String token = "2682d747";
	String ts = "1573225058000";
	String type = "info";
	String url = '';

	ModelNewsItem() {
		// hole
	}

	void update(dynamic data) {

		// 内容
		this.content = new List<ModelContent>();
		var content = data['content'];
		if (content != null) {
			for(Map item in content) {
				ModelContent itemData = new ModelContent();
				itemData.update(item);
				this.content.add(itemData);
			}
		}

		this.contentType = new ModelContentType();
		this.contentType.update(data['content_type']);

		this.ctag = new ModelCtag();
		this.ctag.update(data['ctag']);
		
		// 标签
		this.feedbackTag = new List<ModelFeedBackTag>();
		var feedbackTag = data['feedback_tag'];
		if (feedbackTag != null) {
			for(Map item in feedbackTag) {
				ModelFeedBackTag itemData = new ModelFeedBackTag();
				itemData.update(item);
				this.feedbackTag.add(itemData);
			}
		}

		// this.ext = new ModelExt();
		// this.ext.update(data['ext']);

		// 使用自动反序列化
		this.ext = ModelExt.fromJson(data['ext']);

		// 图片
		this.imageurls = new List<ModelImage>();
		var imageUrls = data['imageurls'];
		if (imageUrls != null) {
			for(Map item in imageUrls) {
				ModelImage itemData = new ModelImage();
				itemData.update(item);
				this.imageurls.add(itemData);
			}
		}

		this.tags = new ModelTags();
		this.tags.update(data['tags']);

		this.topic = data['topic'];
		this.hasRelated = data['has_related'];

		this.emojis = data['emojis'];
		this.abs = data['abs'];
		this.chinajoy = data['chinajoy'];
		this.commentCount = data['comment_count'];
		this.cornerContent = data['corner_content'];
		this.cornerType = data['corner_type'];
		this.displayType = data['display_type'];
		this.displayUrl = data['display_url'];
		this.layout = data['layout'];
		this.longAbs = data['long_abs'];
		this.nType = data['n_type'];
		this.nid = data['nid'];
		this.pulltime = data['pulltime'];
		this.sentimentDisplay = data['sentiment_display'];
		this.site = data['site'];
		this.sourcets = data['sourcets'];
		this.title = data['title'];
		this.token = data['token'];
		this.ts = data['ts'];
		this.type = data['type'];
		this.url = data['url'];
	}
}