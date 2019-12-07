class ApiLibInfo {
	String libId;

	dynamic sourceData = {};

	/// 截取COOKIE值
	void update(Map<String, dynamic> val) {
		val.forEach((String key, dynamic value) {
			if (value != null) {
				sourceData[key] = value;

				if (key == 'set-cookie') {
					dynamic keyList = value;

					for (var i = 0; i < keyList.length; i++) {
						var keyValue = keyList[i];

						// 解释 "__bsi=7429834058670862412_00_88_N_N_743_0303_c02f_Y; max-age=3600; domain=m.baidu.com; path=/"
						if (keyValue.indexOf('__bsi') != -1) {
							var keyValueList = keyValue.split(';');

							for (var k = 0; k < keyValueList.length; k++) {
								var keySubVale = keyValueList[k];

								if (keySubVale.indexOf('__bsi') != -1) {
									var keyBsiValueList = keySubVale.split('=');

									if (keyBsiValueList.length > 0) {
										var keyBsiUnderScoreValue = keyBsiValueList[1];
										var underList = keyBsiUnderScoreValue.split('_');

										if (underList.length > 0) {
											this.libId = underList[0];
											break;
										}
									}
								}
							}
						}
					}
				}
			}
		});
	}
}