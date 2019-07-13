/// Gallery 数据结构
class ModelGallery {

	String name;
	int age;
	double height;

	ModelGallery(this.name, this.age, this.height);

	ModelGallery.empty() {
		this.name = '';
		this.age = 0;
		this.height = 0;
	}

	/// 更新数据源
	void update(dynamic result) {
		print(result);
		// hole
		this.name = 'update name test';
	}
}
