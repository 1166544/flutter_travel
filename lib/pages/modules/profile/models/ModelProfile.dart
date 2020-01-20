/// 我的信息 数据结构
class ModelProfile {

	String name;
	List<ModelGalleryItem> list = [];

	ModelProfile();

	ModelProfile.empty() {
		this.name = '';
	}

	/// 更新数据源
	void update(dynamic result) {
		for(Map item in result.data) {
			ModelGalleryItem itemData = new ModelGalleryItem();
			itemData.update(item);
			this.list.add(itemData);
		}
		this.name = 'udated!';
	}
}

class ModelGalleryItem {
	int userId;
	int id;
	String title;
	String body;

	ModelGalleryItem() {
		// hole
	}

	void update(dynamic data) {
		this.userId = data['userId'];
		this.id = data['id'];
		this.title = data['title'];
		this.body = data['body'];
	}
}
