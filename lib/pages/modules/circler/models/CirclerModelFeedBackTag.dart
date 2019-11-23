class CirclerModelFeedBackTag {
	int id;
	String name;
	int type;

	void update(dynamic resultData) {
		if (resultData != null) {
			this.id = resultData['id'];
			this.name = resultData['name'];
			this.type = resultData['type'];
		}
	}
}