class CirclerModelExt {
	String ac;
	int auth;
	int cms;
	int contentType;
	int interact;
	String qid;
	int readcnt;
	int ts;

	void update(dynamic resultData) {
		this.ac = resultData['ac'];
		this.auth = resultData['auth'];
		this.cms = resultData['cms'];
		this.contentType = resultData['content_type'];
		this.interact = resultData['interact'];
		this.qid = resultData['qid'];
		this.readcnt = resultData['readcnt'];
		this.ts = resultData['ts'];
	}
}