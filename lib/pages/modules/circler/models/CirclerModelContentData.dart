class CirclerModelContentData {
	CirclerModelContentSmall big;
	CirclerModelContentOriginal original;
	CirclerModelContentOriginal originalThird;
	CirclerModelContentSmall small;

	String text;

	void update(dynamic resultData) {
		this.big = new CirclerModelContentSmall();
		dynamic big = resultData['big'];
		this.big.update(big);
		
		this.original = new CirclerModelContentOriginal();
		this.original.update(resultData['original']);

		this.originalThird = new CirclerModelContentOriginal();
		this.originalThird.update(resultData['original_third']);

		this.small = new CirclerModelContentSmall();
		this.small.update(resultData['small']);

		this.text = resultData['text'];
	}
}

class CirclerModelContentSmall {
	int height;
	String url;
	String urlWebp;
	int width;

	void update(dynamic resultData) {
		this.height = resultData['height'];
		this.url = resultData['url'];
		this.urlWebp = resultData['url_web'];
		this.width = resultData['width'];
	}
}

class CirclerModelContentOriginal {
	int height;
	String url;
	int width;

	void update(dynamic resultData) {
		this.height = resultData['height'];
		this.url = resultData['url'];
		this.width = resultData['width'];
	}
}