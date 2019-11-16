class CirclerModelFeedBackTag {
	int id;
	String name;
	int type;

	void update(dynamic resultData) {
		this.id = resultData['id'];
		this.name = resultData['name'];
		this.type = resultData['type'];
	}
}