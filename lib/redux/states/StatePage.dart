import 'package:meta/meta.dart';

@immutable
class StatePage {
	/// 页面标题
	final String title;

	StatePage({
		this.title = ''
	});

	// 返回副本,允许复制之前的AuthState参数时修改这些参数
    StatePage copyWith({
		String title
    }) {
        return StatePage(
            title: title ?? this.title,
        );
    }

	@override
	String toString() {
		return this.title;
	}
}