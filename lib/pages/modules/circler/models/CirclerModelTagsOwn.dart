class CirclerModelTagsOwn {
	int type;
	String name;

	void update(dynamic resultData) {
		this.type = resultData['type'];
		this.name = resultData['name'];
	}
}