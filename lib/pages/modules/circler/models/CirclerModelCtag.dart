class CirclerModelCtag {
	String name;
	int rimShow;

	void update(dynamic resultData) {
		this.name = resultData['name'];
		this.rimShow = resultData['rim_show'];
	}
}