import 'package:json_annotation/json_annotation.dart';

part 'ModelsBingItem.g.dart';

@JsonSerializable(includeIfNull: false)
class ModelsBingItem {
	@JsonKey(name: 'startdate')
	String startdate;
	
	@JsonKey(name: 'fullstartdate')
	String fullstartdate;

	@JsonKey(name: 'enddate')
	String enddate;

	@JsonKey(name: 'url')
	String url;

	@JsonKey(name: 'urlbase')
	String urlbase;

	@JsonKey(name: 'copyright')
	String copyright;

	@JsonKey(name: 'copyrightlink')
	String copyrightlink;

	@JsonKey(name: 'title')
	String title;

	@JsonKey(name: 'quiz')
	String quiz;

	@JsonKey(name: 'wp')
	bool wp;

	@JsonKey(name: 'hsh')
	String hsh;

	@JsonKey(name: 'drk')
	int drk;

	@JsonKey(name: 'top')
	int top;

	@JsonKey(name: 'bot')
	int bot;

	@JsonKey(name: 'hs')
	List<dynamic> hs;

	ModelsBingItem({
		this.startdate,
		this.fullstartdate,
		this.enddate,
		this.url,
		this.urlbase,
		this.copyright,
		this.copyrightlink,
		this.title,
		this.quiz,
		this.wp,
		this.hsh,
		this.drk,
		this.top,
		this.bot,
		this.hs
	});
	
	factory ModelsBingItem.fromJson(Map<String, dynamic> json) => _$ModelsBingItemFromJson(json);
	Map<String, dynamic> toJson() => _$ModelsBingItemToJson(this);
}