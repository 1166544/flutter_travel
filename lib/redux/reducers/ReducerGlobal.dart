import 'package:flutter_travel/redux/actions/ActionGlobal.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';

/// reducer根据传进来的action生成新的state
StateGlobal reducer(StateGlobal state, action) {
	switch(action) {
		// 增加
		case ActionGlobal.increment:
			return StateGlobal(state.count + 1);
		break;

		// 减少
		case ActionGlobal.decrement:
			return StateGlobal(state.count - 1);
		break;
	}

	return state;
}
