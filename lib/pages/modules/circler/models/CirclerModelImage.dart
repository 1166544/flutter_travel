class CirclerModelImage {
	int height;
	String url;
	String urlWebp;
	int width;

	void update(dynamic resultData) {
		this.height = resultData['height'];
		this.url = resultData['url'];
		this.urlWebp = resultData['url_webp'];
		this.width = resultData['width'];
	}
}