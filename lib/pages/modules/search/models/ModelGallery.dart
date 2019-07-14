/// Gallery 数据结构
class ModelGallery {

	String name;
	dynamic list = [];

	ModelGallery();

	ModelGallery.empty() {
		this.name = '';
	}

	/// 更新数据源
	void update(dynamic result) {
		this.list = result.data;
		this.name = 'udated!';
	}
}
