import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocBase.dart';

/// BLOC Provider
class BlocProvider<T extends BlocBase> extends StatefulWidget {

	/// 抽象BLOC对象
	final T bloc;

	/// 抽象子对象
	final Widget child;

	BlocProvider({
		Key key,
		@required this.child,
		@required this.bloc,
	}): super(key: key);

	@override
	_BlocProviderState<T> createState() => _BlocProviderState<T>();

	static T of<T extends BlocBase>(BuildContext context) {
		final type = _typeOf<BlocProvider<T>>();
		print(type.runtimeType);
		BlocProvider<T> provider = context.findAncestorWidgetOfExactType();

		return provider.bloc;
	}

	static Type _typeOf<T>() => T;
}

/// 实现DISPOSE自动调用
class _BlocProviderState<T> extends State<BlocProvider<BlocBase>>{

	@override
	void dispose() {
		widget.bloc.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return widget.child;
	}
}
