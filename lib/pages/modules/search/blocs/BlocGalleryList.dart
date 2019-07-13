import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/pages/modules/search/models/ModelGallery.dart';
import 'package:flutter_travel/services/ServiceJsonPlaceHolder.dart';

/// 列表数据
class BlocGalleryList implements BlocBase {

	ModelGallery _gallery;
	ServiceJsonPlaceHolder _serviceJsonPlaceHolder;

	// 数据流处理器
	StreamController<ModelGallery> _galleryController;
	Sink<ModelGallery> get _inGallery => _galleryController.sink;
	Stream<ModelGallery> get outGallery => _galleryController.stream;

	BlocGalleryList() {
		this._galleryController = StreamController<ModelGallery>.broadcast();
		this._serviceJsonPlaceHolder = new ServiceJsonPlaceHolder();
		this.init();
	}

	void init() async {
		dynamic result = await this._serviceJsonPlaceHolder.getPostsData();
		this._gallery = new ModelGallery('name', 0, 190);
		this._gallery.update(result);
		this._inGallery.add(this._gallery);
	}

	@override
	void dispose() {
		this._galleryController.close();
	}

	void updateGallery(ModelGallery gallery) {
		this._gallery = gallery;
		this._inGallery.add(this._gallery);
	}

}
