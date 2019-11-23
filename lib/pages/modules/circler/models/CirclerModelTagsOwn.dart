class CirclerModelTagsOwn {
	int type;
	String name;

	void update(dynamic resultData) {
		if (resultData != null) {
			this.type = resultData['type'];
			this.name = resultData['name'];
		}
	}
}