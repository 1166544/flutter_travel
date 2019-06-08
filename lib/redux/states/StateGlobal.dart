import 'package:flutter/widgets.dart';

/// 全局STATE
@immutable
class StateGlobal {
	final int _count;
	get count => this._count;

	StateGlobal(this._count);

	StateGlobal.initState(): _count = 0;
}

/// 定义操作state的全部action
enum Action {
	increment
}

/// reducer根据传进来的action生成新的state
StateGlobal reducer(StateGlobal state, action) {
	switch(action) {
		case Action.increment:
			return StateGlobal(state.count + 1);
		break;
	}

	return state;
}
