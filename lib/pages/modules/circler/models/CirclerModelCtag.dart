class CirclerModelCtag {
	String name;
	int rimShow;

	void update(dynamic resultData) {
		if (resultData != null) {
			this.name = resultData['name'];
			this.rimShow = resultData['rim_show'];
		}
	}
}