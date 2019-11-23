
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelContent.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelContentType.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelCtag.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelExt.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelFeedBackTag.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelImage.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelTags.dart';

/// 新闻详情内容
class CirclerModelNewsItem {
	List<CirclerModelContent> content;
	CirclerModelContentType contentType;
	CirclerModelCtag ctag;
	List<CirclerModelFeedBackTag> feedbackTag;
	CirclerModelExt ext;
	List<CirclerModelImage> imageurls;
	CirclerModelTags tags;
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

	CirclerModelNewsItem() {
		// hole
	}

	void update(dynamic data) {

		// 内容
		this.content = new List<CirclerModelContent>();
		var content = data['content'];
		if (content != null) {
			for(Map item in content) {
				CirclerModelContent itemData = new CirclerModelContent();
				itemData.update(item);
				this.content.add(itemData);
			}
		}

		this.contentType = new CirclerModelContentType();
		this.contentType.update(data['content_type']);

		this.ctag = new CirclerModelCtag();
		this.ctag.update(data['ctag']);
		
		// 标签
		this.feedbackTag = new List<CirclerModelFeedBackTag>();
		var feedbackTag = data['feedback_tag'];
		if (feedbackTag != null) {
			for(Map item in feedbackTag) {
				CirclerModelFeedBackTag itemData = new CirclerModelFeedBackTag();
				itemData.update(item);
				this.feedbackTag.add(itemData);
			}
		}

		this.ext = new CirclerModelExt();
		this.ext.update(data['ext']);

		// 图片
		this.imageurls = new List<CirclerModelImage>();
		var imageUrls = data['imageurls'];
		if (imageUrls != null) {
			for(Map item in imageUrls) {
				CirclerModelImage itemData = new CirclerModelImage();
				itemData.update(item);
				this.imageurls.add(itemData);
			}
		}

		this.tags = new CirclerModelTags();
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