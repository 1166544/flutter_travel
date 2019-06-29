import 'package:flutter/widgets.dart';

/// 全局STATE数据结构
@immutable
class StateGlobal {

	final int _count;

	/// 计数器示例
	get count {
		if (this._count < 0) {
			return 0;
		}
		return this._count;
	}

	StateGlobal(this._count);

	StateGlobal.initState(): _count = 0;
}
