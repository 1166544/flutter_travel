class ApiToken {
	List<String> connection;
	List<String> lastModifyed;
	List<String> setCookie;
	List<String> date;
	List<String> p3p;
	List<String> tracecode;
	List<String> server;
	String token;
	String cookie;

	bool _isExpire = false;

	/// 检测是否过期
	bool checkIsExpire() {
		// Last-Modified: Wed, 17 Jul 2019 09:51:50 GMT
		return this._isExpire;
	}

	/// 更新过期数据
	void updateExpire(bool val) {
		this._isExpire = val;
	}

	/// 截取COOKIE值
	void update(dynamic val) {
		this.connection = val['connection'];
		this.lastModifyed = val['last-modified'];
		this.setCookie = val['set-cookie'];
		this.date = val['date'];
		this.p3p = val['p3p'];
		this.tracecode = val['tracecode'];
		this.server = val['server'];

		if (this.setCookie.length > 0) {
			String firstItem = this.setCookie[0];
			this.cookie = firstItem;

			List<String> firstItemList = firstItem.split(';');

			if (firstItemList.length > 0) {
				this.token = firstItemList[0];
				this.updateExpire(false);
			}

		}
	}
}
