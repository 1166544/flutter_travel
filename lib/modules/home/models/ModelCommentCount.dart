import 'dart:convert';

/// 评论数据
class ModelCommentCount {
	String name;
	int errno;
	String requestId;
	double timestamp;
	CirclerModelCommentItem data;

	ModelCommentCount();

	ModelCommentCount.empty() {
		this.name = '';
	}

	/// 更新数据源
	void update(dynamic resultData) {
		dynamic resulDataStr = resultData.data;
		dynamic result = json.decode(resulDataStr);
		var errmsg = result['errno'];

		if (result != null && errmsg == 0) {
			dynamic data = result['data'];
			
			if (data != null) {
				this.data = new CirclerModelCommentItem();
				this.data.update(data);
			}
		}
		this.name = 'updated!';
	}
}

/// 评论数据源
class CirclerModelCommentItem {
	String name;
	int up;
	int down;
	int comment;

	CirclerModelCommentItem();

	CirclerModelCommentItem.empty() {
		this.name = '';
	}

	/// 更新数据源
	void update(dynamic resultData) {
		var count = resultData['count'];

		if (count != null) {
			this.up = count['up'];
			this.down = count['down'];
			this.comment = count['comment'];
		}
	}
}