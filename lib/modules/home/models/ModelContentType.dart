class ModelContentType {
	int image;

	void update(dynamic resultData) {
		if (resultData != null) {
			this.image = resultData['image'];
		}
	}
}