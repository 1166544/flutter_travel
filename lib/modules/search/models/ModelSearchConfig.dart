import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

/// 模块配置数据
class ModelSearchConfig {
	String env;
	String version;
	String st;
	String uid;
	String preferQuickapp;
	String wm;

	static String finalStReplaceTag = 'st: ';
	static String finalVersionReplaceTag = 'version: ';
	static String finalEnvReplaceTag = 'env: ';
	static String finalUidReplaceTag = 'uid: ';
	static String finalPreferQuickappReplaceTag = 'preferQuickapp: ';
	static String finalWmReplaceTag = 'wm: ';

	static String replaceTag = 'config = ';
	static String localScriptName = 'script';
	static String localVarName = 'var ';
	static String localVersionName = 'version';

	void update({dynamic source}) {
		var html = source ?? '';
		String data = html;
		dom.Document document = parser.parse(data);
		dom.NodeList nodeList = document.body.nodes;

		for (var item in nodeList) {
			dynamic forItem = item;

			String forStr = forItem.text;
			List<String> forStrList = forStr.split(localVarName);

			if (forStrList != null && forStrList.length > 0) {
				for (var i = 0; i < forStrList.length; i++) {
					String forCompareItem = forStrList[i];

					if (forCompareItem.indexOf(replaceTag) != -1) {
						String forEndReplaceStr = forCompareItem.replaceAll(new RegExp(replaceTag), '');

						if (forEndReplaceStr.indexOf(localVersionName) != -1) {
							List<String> forEndReplaceStrList = forEndReplaceStr.split(',');
							
							for (var k = 0; k < forEndReplaceStrList.length; k++) {
								String forEndCompareItem = forEndReplaceStrList[k];
								forEndCompareItem = forEndCompareItem.replaceAll(new RegExp('}'), '');
								forEndCompareItem = forEndCompareItem.replaceAll(new RegExp('{'), '');
								forEndCompareItem = forEndCompareItem.trim();
								if (forEndCompareItem.startsWith(' ') || forEndCompareItem.startsWith('\n')) {
									forEndCompareItem = forEndCompareItem.trimLeft();
								}
								if (forEndCompareItem.endsWith(' ') || forEndCompareItem.endsWith('\n')) {
									forEndCompareItem = forEndCompareItem.trimRight();
								}

								if (forEndCompareItem.indexOf(finalStReplaceTag) != -1) {
									this.st = forEndCompareItem.replaceAll(new RegExp(finalStReplaceTag), '');
									this.st = this.st.replaceAll(new RegExp('"'), '');
									this.st = this.st.replaceAll(new RegExp("'"), '');
								}
								if (forEndCompareItem.indexOf(finalVersionReplaceTag) != -1) {
									this.version = forEndCompareItem.replaceAll(new RegExp(finalVersionReplaceTag), '');
								}
								if (forEndCompareItem.indexOf(finalEnvReplaceTag) != -1) {
									this.version = forEndCompareItem.replaceAll(new RegExp(finalEnvReplaceTag), '');
								}
								if (forEndCompareItem.indexOf(finalUidReplaceTag) != -1) {
									this.uid = forEndCompareItem.replaceAll(new RegExp(finalUidReplaceTag), '');
								}
								if (forEndCompareItem.indexOf(finalPreferQuickappReplaceTag) != -1) {
									this.preferQuickapp = forEndCompareItem.replaceAll(new RegExp(finalPreferQuickappReplaceTag), '');
								}
								if (forEndCompareItem.indexOf(finalWmReplaceTag) != -1) {
									this.wm = forEndCompareItem.replaceAll(new RegExp(finalWmReplaceTag), '');
								}
							}
						}
					}
				}
			}
		}
	}
}