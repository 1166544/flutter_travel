import 'package:flutter/widgets.dart';

/// 全局STATE
@immutable
class StateGlobal {
	final int _count;
	get count => this._count;

	StateGlobal(this._count);

	StateGlobal.initState(): _count = 0;
}
